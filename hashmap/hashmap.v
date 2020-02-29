// Copyright (c) 2019-2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module hashmap

import hash.wyhash

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
	// min load-factor
	min_load_factor = 0.4
	// Initial range cap
	init_cap = init_capicity - 2
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
	key_values      DenseArray
	// Pointer to meta-data
	meta            &u32
	// Measure that decides when to increase the capacity
	max_load_factor f32
pub mut:
	// Number of key-values currently in the hashmap
	size            int
}

struct Kv {
	key   string
mut:
	value int
}

pub fn new_hmap() Hashmap {
	return Hashmap{
		cap: init_cap
		shift: init_log_capicity
		window: cached_hashbits
		key_values: new_dense_array()
		meta: &u32(calloc(sizeof(u32) * init_capicity))
		max_load_factor: init_max_load_factor
		size: 0
	}
}

// Dynamic array with very low growth factor
struct DenseArray {
mut:
	data &Kv
	cap  u32
	size u32
}

[inline]
fn new_dense_array() DenseArray {
	unsafe {
		return DenseArray {
			data: &Kv(malloc(8 * sizeof(Kv)))
			cap: 8
			size: 0
		}
	}
}

// Push element to array and return index
// The growth-factor is roughly 12.5 `(x + (x >> 3))`
[inline]
fn (d mut DenseArray) push(value Kv) u32 {
	if d.cap == d.size {
		d.cap += d.cap >> 3
		d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
	}
	push_index := d.size
	d.data[push_index] = value
	d.size++
	return push_index
}

// Move all zeros to the end of the array
// and resize array
fn (d mut DenseArray) zeros_to_end() {
	mut count := u32(0)
	for i in 0..d.size {
		if d.data[i].key.str != 0 {
			d.data[count] = d.data[i]
			count++
		}
	}
	d.size = count
	d.cap = if count < 8 {8} else {count}
	d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
}

pub fn (h mut Hashmap) set(key string, value int) {
	if (f32(h.size << 1) / f32(h.cap)) > h.max_load_factor {
		h.expand()
	}
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut meta := u32(((hash >> h.shift) & hash_mask) | probe_inc)
	mut index := hash & h.cap
	// While probe count is less
	for meta < h.meta[index] {
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	// While we might have a match
	for meta == h.meta[index] {
		kv_index := h.meta[index + 1]
		if key == h.key_values.data[kv_index].key {
			h.key_values.data[kv_index].value = value
			return
		}
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	// Match is not possible anymore.
	// Probe until an empty index is found.
	// Swap when probe count is higher/richer (Robin Hood).
	kv := Kv{key, value}
	mut kv_index := h.key_values.push(kv)
	for h.meta[index] != 0 {
		if meta > h.meta[index] {
			tmp_meta := h.meta[index]
			h.meta[index] = meta
			meta = tmp_meta
			tmp_index := h.meta[index + 1]
			h.meta[index + 1] = kv_index
			kv_index = tmp_index
		}
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	// Should almost never happen
	if (meta & max_probe) == max_probe {
		h.expand()
		h.set(kv.key, kv.value)
		return
	}
	h.meta[index] = meta
	h.meta[index + 1] = kv_index
	h.size++
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

// Halves the size of the hashmap
fn (h mut Hashmap) shrink() {
	h.key_values.zeros_to_end()
	h.cap = ((h.cap + 2)>>1) - 2
	if h.window == 16 {
		h.shift -= cached_hashbits
		h.window = 0
	}
	h.rehash()
	h.window++
}

fn (h mut Hashmap) rehash() {
	h.meta = &u32(realloc(h.meta, sizeof(u32) * (h.cap + 2)))
	C.memset(h.meta, 0, sizeof(u32) * (h.cap + 2))
	for i := u32(0); i < h.key_values.size; i++ {
		if h.key_values.data[i].key.str == 0 {
			continue
		}
		kv := h.key_values.data[i]
		hash := wyhash.wyhash_c(kv.key.str, u64(kv.key.len), 0)
		mut meta := u32(((hash>>h.shift) & hash_mask) | probe_inc)
		mut index := hash & h.cap
		// While probe count is less
		for meta < h.meta[index] {
			index = (index + 2) & h.cap
			meta += probe_inc
		}
		// Match is not possible anymore.
		// Probe until an empty index is found.
		// Swap when probe count is higher/richer (Robin Hood).
		mut kv_index := i
		for h.meta[index] != 0 {
			if meta > h.meta[index] {
				tmp_meta := h.meta[index]
				h.meta[index] = meta
				meta = tmp_meta
				tmp_index := h.meta[index + 1]
				h.meta[index + 1] = kv_index
				kv_index = tmp_index
			}
			index = (index + 2) & h.cap
			meta += probe_inc
		}
		// Should almost never happen
		if (meta & max_probe) == max_probe {
			h.expand()
			h.set(kv.key, kv.value)
			return
		}
		h.meta[index] = meta
		h.meta[index + 1] = kv_index
	}
}

fn (h mut Hashmap) cached_rehash(old_cap u32) {
	mut new_meta := &u32(calloc(sizeof(u32) * (h.cap + 2)))
	for i := 0; i <= old_cap; i += 2 {
		if h.meta[i] == 0 {
			continue
		}
		old_meta := h.meta[i]
		old_probe_count := u64((old_meta>>hashbits) - 1) << 1
		old_index := (i - old_probe_count) & (h.cap >> 1)
		mut index := u64(old_index) | (old_meta << h.shift) & h.cap
		mut meta := (old_meta & hash_mask) | probe_inc
		// While probe count is less
		for meta < new_meta[index] {
			index = (index + 2) & h.cap
			meta += probe_inc
		}
		// Match is not possible anymore.
		// Probe until an empty index is found.
		// Swap when probe count is higher/richer (Robin Hood).
		mut kv_index := h.meta[i + 1]
		kv := h.key_values.data[kv_index]
		for new_meta[index] != 0 {
			if meta > new_meta[index] {
				tmp_meta := new_meta[index]
				new_meta[index] = meta
				meta = tmp_meta
				tmp_index := new_meta[index + 1]
				new_meta[index + 1] = kv_index
				kv_index = tmp_index
			}
			index = (index + 2) & h.cap
			meta += probe_inc
		}
		// Should almost never happen
		if (meta & max_probe) == max_probe {
			h.expand()
			h.set(kv.key, kv.value)
			return
		}
		new_meta[index] = meta
		new_meta[index + 1] = kv_index
	}
	unsafe{
		free(h.meta)
	}
	h.meta = new_meta
}

pub fn (h Hashmap) get(key string) int {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.cap
	mut meta := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for meta < h.meta[index] {
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	for meta == h.meta[index] {
		kv_index := h.meta[index + 1]
		if key == h.key_values.data[kv_index].key {
			return h.key_values.data[kv_index].value
		}
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	return 0
}

pub fn (h Hashmap) exists(key string) bool {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.cap
	mut meta := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for meta < h.meta[index] {
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	for meta == h.meta[index] {
		kv_index := h.meta[index + 1]
		if key == h.key_values.data[kv_index].key {
			return true
		}
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	return false
}

pub fn (h mut Hashmap) delete(key string) {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.cap
	mut meta := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for meta < h.meta[index] {
		index = (index + 2) & h.cap
		meta += probe_inc
	}
	// Perform backwards shifting
	for meta == h.meta[index] {
		kv_index := h.meta[index + 1]
		if key == h.key_values.data[kv_index].key {
			memset(&h.key_values.data[kv_index], 0, sizeof(Kv))
			mut old_index := index
			index = (index + 2) & h.cap
			mut cur_meta := h.meta[index]
			mut cur_index := h.meta[index + 1]
			for (cur_meta >> hashbits) > 1 {
				h.meta[old_index] = cur_meta - probe_inc
				h.meta[old_index + 1] = cur_index
				old_index = index
				index = (index + 2) & h.cap
				cur_meta = h.meta[index]
				cur_index = h.meta[index + 1]
			}
			h.meta[old_index] = 0
			h.size--
			if h.cap == 14 {return}
			if (f32(h.size << 1) / f32(h.cap)) < min_load_factor {
				h.shrink()
			}
			return
		}
		index = (index + 2) & h.cap
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

pub fn (h mut Hashmap) set_max_load_factor(new_lf f32) {
	if new_lf > 1.0 {
		h.max_load_factor = 1.0
	}
	else if new_lf < 0.1 {
		h.max_load_factor = 0.5
	}
	else {
		h.max_load_factor = new_lf
	}
}
