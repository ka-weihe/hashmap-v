// Copyright (c) 2019-2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module hashmap

import hash.wyhash

/*
This is a very fast hashmap implementation. It has several properties that in 
combination makes it very fast. Here is a short explanation of each property. 
After reading this you should have a basic understanding of how it works:

1. |Hash-function (Wyhash)|. Wyhash is the fastest hash-function passing SMHash-
er, so it was an easy choice.

2. |Open addressing (Robin Hood Hashing)|. With this method a hash collision is 
resolved by probing. As opposed to linear probing, Robin Hood hashing has a sim-
ple but clever twist: As new keys are inserted, old keys are shifted around in a
way such that all keys stay reasonably close to the slot they originally hash to.

3. |Memory layout|. Key-value pairs are stored in a `DenseArray`, with an avera-
ge of roughly 6.25% unused memory, as opposed to most other dynamic array imple-
mentations with a growth factor of 1.5 or 2. The key-values keep their index in 
the array - they are not probed. Instead, this implementation uses another array 
"metas" storing "metas" (meta-data). Each Key-value has a corresponding meta. A 
meta stores a reference to its key-value, and its index in "metas" is determined
by the hash of the key and probing. A meta also stores bits from the hash (for 
faster rehashing etc.) and how far away it is from the index it was originally 
hashed to (probe_count). probe_count is 0 if empty, 1 if not probed, 2 if probed
by 1.

meta (64 bit) =  kv_index (32 bit) | probe_count (8 bits) | hashbits (24 bits)
metas = [meta, 0, meta, 0, meta, meta, meta, 0, ...]
key_values = [kv, kv, kv, kv, kv, ...]

4. |Power of two size array|. The size of metas is a power of two. This makes it 
possible to find a bucket from a hash code you can use hash & (SIZE -1) instead 
of abs(hash) % SIZE. Modulo is extremely expensive so using '&' is a big perfor-
mance improvement. The general concern with this is that you only use the lower
bits of the hash and can cause many collisions. This is solved by using very go-
od hash-function. 

5. |Extra metas|. The hashmap keeps track of the highest probe_count. The trick 
is to allocate extra metas > max(probe_count), so you never have to do any boun-
ds-checking because the extra metas ensures that an element will never go beyond 
index the last index. 

6. |Cached rehashing|. When the load_factor of the map exceeds the max_load_fac-
tor the size of metas is doubled and all the elements need to be "rehashed" to
find the index in the new array. Instead of rehashing complete, it simply uses 
the hashbits stored in the meta.  
*/

const (
	// Number of bits from the hash stored for each entry
	hashbits = 24
	// Number of bits from the hash stored for rehasing
	cached_hashbits = 16
	// Initial log-number of buckets in the hashtable
	init_log_capicity = 5
	// Initial number of buckets in the hashtable
	init_capicity = 1 << init_log_capicity
	// Initial max load-factor
	init_max_load_factor = 0.8
	// Initial range cap
	init_cap = init_capicity - 2
	// Used for incrementing `extra_metas` when max
	// probe count is too high, to avoid overflow
	extra_metas_inc = 4
	// Bitmask to select all the hashbits
	hash_mask = u32(0x00FFFFFF)
	// Used for incrementing the probe-count
	probe_inc = u32(0x01000000) 
	// Bitmask for maximum probe count
	max_probe = u32(0xFF000000)
)

pub struct Hashmap {
mut:
	// Index of the highest index in the hashtable
	cap             u32
	// Number of cached hashbits left for rehasing
	window          byte
	// Used for right-shifting out used hashbits
	shift           byte
	// Pointer to Key-value memory
	key_values      DenseArr
	// Pointer to meta-data
	metas           &u32
	// Measure that decides when to increase the capacity
	max_load_factor f32
	// Extra metas that allows for no ranging when incrementing
	// index in the hashmap
	extra_metas     u32
pub mut:
	// Number of key-values currently in the hashmap
	size            int
}

struct Kv {
mut:
	key   string
	value int
}

pub fn new_hmap() Hashmap {
	return Hashmap{
		cap: init_cap
		shift: init_log_capicity
		window: cached_hashbits
		key_values: new_dense_arr()
		metas: &u32(vcalloc(sizeof(u32) * (init_capicity + extra_metas_inc)))
		max_load_factor: init_max_load_factor
		extra_metas: extra_metas_inc
		size: 0
	}
}

// Dynamic array with very low growth factor
struct DenseArr {
mut:
	data    &Kv
	cap     u32
	size    u32
	deletes u32
}

[inline]
fn new_dense_arr() DenseArr {
	unsafe {
		return DenseArr {
			data: &Kv(malloc(8 * sizeof(Kv)))
			cap: 8
			size: 0
			deletes: 0
		}
	}
}

// Push element to array and return index
// The growth-factor is roughly 12.5 `(x + (x >> 3))`
[inline]
fn (d mut DenseArr) push(key string, value int) u32 {
	if d.cap == d.size {
		d.cap += d.cap >> 3
		d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
	}
	push_index := d.size
	d.data[push_index].key = key
	d.data[push_index].value = value
	d.size++
	return push_index
}

fn (d mut DenseArr) delete(m mut Hashmap, index u32) {
	memset(&d.data[index], 0, sizeof(Kv))
	d.deletes++
	if d.size <= 32 {return}
	if d.deletes >= (d.size >> 1) {
		d.zeros_to_end()
		m.rehash()
		d.deletes = 0
	}
}

// Move all zeros to the end of the array
// and resize array
fn (d mut DenseArr) zeros_to_end() {
	mut count := u32(0)
	for i in 0..d.size {
		if d.data[i].key.str != 0 {
			tmp := d.data[count]
			d.data[count] = d.data[i]
			d.data[i] = tmp
			count++
		}
	}
	d.size = count
	d.cap = if count <= 8 {8} else {count}
	d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
}

[inline]
fn (h Hashmap) key_to_index(key string) (u32, u32) {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	index := u32(hash) & h.cap
	meta := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	return index, meta
}

[inline]
fn (h Hashmap) meta_less2(i u32, m u32) (u32, u32){
	mut index := i
	mut meta := m
	for meta < h.metas[index] {
		index += 2
		meta += probe_inc
	}
	return index, meta
}

[inline]
fn (h mut Hashmap) meta_greater(i u32, m u32, kvi u32) {
	mut meta := m 
	mut index := i
	mut kv_index := kvi
	for h.metas[index] != 0 {
		if meta > h.metas[index] {
			tmp_meta := h.metas[index]
			h.metas[index] = meta
			meta = tmp_meta
			tmp_index := h.metas[index + 1]
			h.metas[index + 1] = kv_index
			kv_index = tmp_index
		}
		index += 2
		meta += probe_inc
	}
	probe_count := (meta >> hashbits) - 1
	if (probe_count << 1) == h.extra_metas {
		// Should almost never happen
		h.extra_metas += extra_metas_inc
		mem_size := (h.cap + 2 + h.extra_metas)
		h.metas = &u32(realloc(h.metas, sizeof(u32) * mem_size))
		C.memset(h.metas + mem_size - extra_metas_inc, 0, sizeof(u32) * extra_metas_inc)
		if probe_count == 252 {
			panic("Probe overflow")
		}
	} 
	h.metas[index] = meta
	h.metas[index + 1] = kv_index
}

pub fn (h mut Hashmap) set(key string, value int) {
	load_factor := f32(h.size << 1) / f32(h.cap)
	if load_factor > h.max_load_factor {
		h.expand()
	}
	mut index, mut meta := h.key_to_index(key)
	index, meta = h.meta_less2(index, meta)
	// While we might have a match
	for meta == h.metas[index] {
		kv_index := h.metas[index + 1]
		if key == h.key_values.data[kv_index].key {
			h.key_values.data[kv_index].value = value
			return
		}
		index += 2
		meta += probe_inc
	}
	// kv := Kv{key, value}
	kv_index := h.key_values.push(key, value)
 	h.meta_greater(index, meta, kv_index)
	h.size++ 
}

fn (h mut Hashmap) rehash() {
	meta_bytes := sizeof(u32) * (h.cap + 2 + h.extra_metas)
	h.metas = &u32(realloc(h.metas, meta_bytes))
	C.memset(h.metas, 0, meta_bytes)
	for i := u32(0); i < h.key_values.size; i++ {
		if h.key_values.data[i].key.str == 0 {
			continue
		}
		mut index, mut meta := h.key_to_index(h.key_values.data[i].key)
		index, meta = h.meta_less2(index, meta)
		h.meta_greater(index, meta, i)
	}
}

fn (h mut Hashmap) cached_rehash(old_cap u32) {
	old_metas := h.metas
	h.metas = &u32(vcalloc(sizeof(u32) * (h.cap + 2 + h.extra_metas)))
	old_extra_metas := h.extra_metas
	for i := u32(0); i <= old_cap + old_extra_metas; i += 2 {
		if old_metas[i] == 0 {
			continue
		}
		old_meta := old_metas[i]
		old_probe_count := ((old_meta >> hashbits) - 1) << 1
		old_index := (i - old_probe_count) & (h.cap >> 1)
		mut index := (old_index | (old_meta << h.shift)) & h.cap
		mut meta := (old_meta & hash_mask) | probe_inc
		index, meta = h.meta_less2(index, meta)
		kv_index := old_metas[i + 1]
		h.meta_greater(index, meta, kv_index)
	}
	unsafe{
		free(old_metas)
	}
}

// Doubles the size of the hashmap
fn (h mut Hashmap) expand() {
	old_cap := h.cap
	h.cap = ((h.cap + 2)<<1) - 2
	// Check if any hashbits are left
	if h.window == 0 {
		h.shift += cached_hashbits
		h.rehash()
		h.window = cached_hashbits
	}
	else {
		h.cached_rehash(old_cap)
	}
	h.window--
}

[inline]
pub fn (h Hashmap) get(key string) int {
	mut index, mut meta := h.key_to_index(key)
	index, meta = h.meta_less2(index, meta)
	for meta == h.metas[index] {
		kv_index := h.metas[index + 1]
		if key == h.key_values.data[kv_index].key {
			return h.key_values.data[kv_index].value
		}
		index += 2
		meta += probe_inc
	}
	return 0
}

pub fn (h Hashmap) exists(key string) bool {
	mut index, mut meta := h.key_to_index(key)
	index, meta = h.meta_less2(index, meta)
	for meta == h.metas[index] {
		kv_index := h.metas[index + 1]
		if key == h.key_values.data[kv_index].key {
			return true
		}
		index += 2
		meta += probe_inc
	}
	return false
}

pub fn (h mut Hashmap) delete(key string) {
	mut index, mut meta := h.key_to_index(key)
	index, meta = h.meta_less2(index, meta)
	// Perform backwards shifting
	for meta == h.metas[index] {
		kv_index := h.metas[index + 1]
		if key == h.key_values.data[kv_index].key {
			for (h.metas[index + 2] >> hashbits) > 1 {
				h.metas[index] = h.metas[index + 2] - probe_inc
				h.metas[index + 1] = h.metas[index + 3]
				index += 2
			}
			h.size--
			h.metas[index] = 0
			h.metas[index + 1] = 0
			h.key_values.delete(mut h, kv_index)
			return
		}
		index += 2
		meta += probe_inc
	}
}

pub fn (h Hashmap) keys() []string {
	mut keys := [''].repeat(h.size)
	mut j := 0
	for i := u32(0); i < h.key_values.size; i++ {
		if h.key_values.data[i].key.str == 0 {
			continue
		}
		keys[j] = h.key_values.data[i].key
		j++
	}
	return keys
}

pub fn (h Hashmap) free() {
	unsafe {
		free(h.metas)
		free(h.key_values.data)
	}
}

