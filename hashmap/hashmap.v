// Copyright (c) 2019 Alexander Medvednikov. All rights reserved.
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
	log_init_capicity = 4
	// Initial number of buckets in the hashtable
	init_capicity = 1<<log_init_capicity
	// Initial max load-factor
	init_max_load_factor = 0.8
	// Initial min load-factor
	init_min_load_factor = 0.4
	// Initial range cap
	init_range_cap = init_capicity - 2
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
	range_cap   u32
	// Number of cached hashbits left for rehasing
	window      byte
	// Used for right-shifting out used hashbits
	shift       byte
	// Pointer to Key-value memory
	key_values  DenseArray
	// Pointer to probe_hash memory. Each Key-value has a
	// corresponding probe_hash-DWORD. Upper-bits are the
	// probe-count and lower-bits are bits from the hash.
	probe_hash  &u32
	// Measure that decides when to increase the capacity
	load_factor f32
pub mut:
	// Number of key-values currently in the hashmap
	size        int
}

struct Kv {
	key   string
mut:
	value int
}

struct DenseArray {
pub mut:
	data	&Kv
	cap		u32
	size  u32
}

fn new_dense_array() DenseArray {
	return DenseArray {
		data: &Kv(malloc(16 * sizeof(Kv)))
		cap: 16
		size: 0
	}
}

[inline]
fn (d mut DenseArray) push(value Kv) u32 {
	if d.cap == (d.size + 1) {
		d.cap += d.cap >> 3
		d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
	}
	push_index := d.size
	d.data[push_index] = value
	d.size++
	return push_index
}

[inline]
fn (d mut DenseArray) zeros_to_end() {
	mut count := u32(0)
	for i in 0..d.size {
		if d.data[i].key.str != 0 {
			d.data[count] = d.data[i]
			count++
		}
	}
	d.size = count
	d.cap = if count < 16 {16} else {count}
	d.data = &Kv(realloc(d.data, sizeof(Kv) * d.cap))
}

pub fn new_hmap() Hashmap {
	return Hashmap{
		range_cap: init_range_cap
		shift: log_init_capicity
		window: cached_hashbits
		key_values: new_dense_array()
		probe_hash: &u32(calloc(sizeof(u32) * init_capicity))
		load_factor: init_max_load_factor
		size: 0
	}
}

pub fn (h mut Hashmap) set(key string, value int) {
	// load_factor can be adjusted.
	if (f32(h.size << 1) / f32(h.range_cap)) > h.load_factor {
		h.rehash()
	}
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut probe_hash := u32(hash & hash_mask) | probe_inc
	mut index := hash & h.range_cap
	// While probe count is less
	for probe_hash < h.probe_hash[index] {
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	// While we might have a match
	for probe_hash == h.probe_hash[index] {
		key_value_index := h.probe_hash[index + 1]
		if key == h.key_values.data[key_value_index].key {
			h.key_values.data[key_value_index].value = value
			return
		}
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	// Match is not possible anymore.
	// Probe until an empty index is found.
	// Swap when probe count is higher/richer (Robin Hood).
	kv := Kv{key, value}
	mut push_index := h.key_values.push(kv)
	for h.probe_hash[index] != 0 {
		if probe_hash > h.probe_hash[index] {
			tmp_probe_hash := h.probe_hash[index]
			h.probe_hash[index] = probe_hash
			probe_hash = tmp_probe_hash
			tmp_index := h.probe_hash[index + 1]
			h.probe_hash[index + 1] = push_index
			push_index = tmp_index
		}
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	// Should almost never happen
	if (probe_hash & max_probe) == max_probe {
		h.rehash()
		h.set(kv.key, kv.value)
		return
	}
	h.probe_hash[index] = probe_hash
	h.probe_hash[index + 1] = push_index
	h.size++
}

fn (h mut Hashmap) rehash() {
	h.range_cap = ((h.range_cap + 2)<<1) - 2
	h.probe_hash = &u32(realloc(h.probe_hash, sizeof(u32) * (h.range_cap + 2)))
	C.memset(h.probe_hash, 0, sizeof(u32) * (h.range_cap + 2))
	for i := u32(0); i < h.key_values.size; i++ {
			if h.key_values.data[i].key.str == 0 {
				continue
			}
			key := h.key_values.data[i].key
			value := h.key_values.data[i].value
			hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
			mut probe_hash := u32(hash & hash_mask) | probe_inc
			mut index := hash & h.range_cap
			// While probe count is less
			for probe_hash < h.probe_hash[index] {
				index = (index + 2) & h.range_cap
				probe_hash += probe_inc
			}
			// Match is not possible anymore.
			// Probe until an empty index is found.
			// Swap when probe count is higher/richer (Robin Hood).
			kv := Kv{key, value}
			mut push_index := i
			for h.probe_hash[index] != 0 {
				if probe_hash > h.probe_hash[index] {
					tmp_probe_hash := h.probe_hash[index]
					h.probe_hash[index] = probe_hash
					probe_hash = tmp_probe_hash
					tmp_index := h.probe_hash[index + 1]
					h.probe_hash[index + 1] = push_index
					push_index = tmp_index
				}
				index = (index + 2) & h.range_cap
				probe_hash += probe_inc
			}
			// Should almost never happen
			if (probe_hash & max_probe) == max_probe {
				h.rehash()
				h.set(kv.key, kv.value)
				return
			}
			h.probe_hash[index] = probe_hash
			h.probe_hash[index + 1] = push_index
	}
}

pub fn (h Hashmap) get(key string) int {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(hash & hash_mask) | probe_inc
	for probe_hash < h.probe_hash[index] {
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	for probe_hash == h.probe_hash[index] {
		key_value_index := h.probe_hash[index + 1]
		if key == h.key_values.data[key_value_index].key {
			return h.key_values.data[key_value_index].value
		}
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	return 0
}

pub fn (h Hashmap) exists(key string) bool {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(hash & hash_mask) | probe_inc
	for probe_hash < h.probe_hash[index] {
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	for probe_hash == h.probe_hash[index] {
		key_value_index := h.probe_hash[index + 1]
		if key == h.key_values.data[key_value_index].key {
			return true
		}
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	return false
}

pub fn (h mut Hashmap) delete(key string) {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(hash & hash_mask) | probe_inc
	for probe_hash < h.probe_hash[index] {
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
	}
	// Perform backwards shifting
	for probe_hash == h.probe_hash[index] {
		key_value_index := h.probe_hash[index + 1]
		if key == h.key_values.data[key_value_index].key {
			memset(&h.key_values.data[key_value_index], 0, sizeof(Kv))
			mut old_index := index
			index = (index + 2) & h.range_cap
			mut current_probe_hash := h.probe_hash[index]
			mut current_index := h.probe_hash[index + 1]
			for (current_probe_hash >> hashbits) > 1 {
				h.probe_hash[old_index] = current_probe_hash - probe_inc
				h.probe_hash[old_index + 1] = current_index
				old_index = index
				index = (index + 2) & h.range_cap
				current_probe_hash = h.probe_hash[index]
				current_index = h.probe_hash[index + 1]
			}
			h.probe_hash[old_index] = 0
			h.size--
			if h.range_cap == 14 {return}
			if (f32(h.size << 1) / f32(h.range_cap)) < init_min_load_factor {
				h.key_values.zeros_to_end()
				h.range_cap = ((h.range_cap + 2)>>2) - 2
				h.rehash()
			}
			return
		}
		index = (index + 2) & h.range_cap
		probe_hash += probe_inc
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

pub fn (h mut Hashmap) set_load_factor(new_load_factor f32) {
	if new_load_factor > 1.0 {
		h.load_factor = 1.0
	}
	else if new_load_factor < 0.1 {
		h.load_factor = 0.1
	}
	else {
		h.load_factor = new_load_factor
	}
}
