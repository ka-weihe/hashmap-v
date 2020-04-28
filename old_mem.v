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
	log_init_capicity = 5
	// Initial number of buckets in the hashtable
	init_capicity = 1<<log_init_capicity
	// Initial load-factor
	init_load_factor = 0.8
	// Initial range cap
	init_range_cap = init_capicity - 1
	// Bitmask to select all the hashbits
	hash_mask = u32(0x00FFFFFF)
	// Used for incrementing the probe-count
	probe_inc = u32(0x01000000)
	// Bitmask for maximum probe count
	max_probe = u32(0xFF000000)
	// Extra metas
	extra_metas = 128
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
	key_values  &Kv
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

pub fn new_hmap() Hashmap {
	probe_hash_bytes := sizeof(u32) * (init_capicity + 128)
	key_value_bytes := sizeof(Kv) * (init_capicity + 128)
	memory := calloc(key_value_bytes + probe_hash_bytes)
	return Hashmap{
		range_cap: init_range_cap
		shift: log_init_capicity
		window: cached_hashbits
		key_values: &Kv(memory)
		probe_hash: &u32(memory + key_value_bytes)
		load_factor: init_load_factor
		size: 0
	}
}

pub fn (h mut Hashmap) set(key string, value int) {
	// load_factor can be adjusted.
	if (f32(h.size) / f32(h.range_cap)) > h.load_factor {
		h.expand()
	}
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut probe_hash := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	mut index := hash & h.range_cap
	// While probe count is less
	for probe_hash < h.probe_hash[index] {
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	// While we might have a match
	for probe_hash == h.probe_hash[index] {
		if key == h.key_values[index].key {
			h.key_values[index].value = value
			return
		}
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	// Match is not possible anymore.
	// Probe until an empty index is found.
	// Swap when probe count is higher/richer (Robin Hood).
	mut current_kv := Kv{key, value}
	for h.probe_hash[index] != 0 {
		if probe_hash > h.probe_hash[index] {
			// Swap probe_hash
			tmp_probe_hash := h.probe_hash[index]
			h.probe_hash[index] = probe_hash
			probe_hash = tmp_probe_hash
			// Swap Kv
			tmp_kv := h.key_values[index]
			h.key_values[index] = current_kv
			current_kv = tmp_kv
		}
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	// Should almost never happen
	if (probe_hash & max_probe) == max_probe {
		h.expand()
		h.set(current_kv.key, current_kv.value)
		return
	}
	h.probe_hash[index] = probe_hash
	h.key_values[index] = current_kv
	h.size++
}

fn (h mut Hashmap) expand() {
	old_range_cap := h.range_cap
	// double the size of the hashmap
	h.range_cap = ((h.range_cap + 1)<<1) - 1
	// check if any hashbits are left
	if h.window == 0 {
		h.shift += cached_hashbits
		h.rehash(old_range_cap)
		h.window = cached_hashbits
	}
	else {
		h.cached_rehash(old_range_cap)
	}
	h.window--
}

fn (h mut Hashmap) rehash(old_range_cap u32) {
	probe_hash_bytes := sizeof(u32) * (h.range_cap + 1 + 128)
	key_value_bytes := sizeof(Kv) * (h.range_cap + 1 + 128)
	memory := calloc(probe_hash_bytes + key_value_bytes)
	mut new_key_values := &Kv(memory)
	mut new_probe_hash := &u32(memory + key_value_bytes)
	for i in 0 .. (old_range_cap + 1) {
		if h.probe_hash[i] != 0 {
			mut kv := h.key_values[i]
			hash := wyhash.wyhash_c(kv.key.str, u64(kv.key.len), 0)
			mut probe_hash := u32(((hash>>h.shift) & hash_mask) | probe_inc)
			mut index := hash & h.range_cap
			// While probe count is less
			for probe_hash < new_probe_hash[index] {
				index = (index + 1) & h.range_cap
				probe_hash += probe_inc
			}
			// Probe until an empty index is found.
			// Swap when probe count is higher/richer (Robin Hood).
			for new_probe_hash[index] != 0 {
				if probe_hash > new_probe_hash[index] {
					// Swap probe_hash
					tmp_probe_hash := new_probe_hash[index]
					new_probe_hash[index] = probe_hash
					probe_hash = tmp_probe_hash
					// Swap Kv
					tmp_kv := new_key_values[index]
					new_key_values[index] = kv
					kv = tmp_kv
				}
				index = (index + 1) & h.range_cap
				probe_hash += probe_inc
			}
			// Should almost never happen
			if (probe_hash & max_probe) == max_probe {
				h.expand()
				h.set(kv.key, kv.value)
				return
			}
			new_probe_hash[index] = probe_hash
			new_key_values[index] = kv
		}
	}
	unsafe{
		free(h.key_values)
	}
	h.key_values = new_key_values
	h.probe_hash = new_probe_hash
}

fn (h mut Hashmap) cached_rehash(old_range_cap u32) {
	probe_hash_bytes := sizeof(u32) * (h.range_cap + 1 + 128)
	key_value_bytes := sizeof(Kv) * (h.range_cap + 1 + 128)
	memory := calloc(probe_hash_bytes + key_value_bytes)
	mut new_probe_hash := &u32(memory + key_value_bytes)
	mut new_key_values := &Kv(memory)
	for i in 0 .. (old_range_cap + 1 + 128) {
		if h.probe_hash[i] != 0 {
			mut kv := h.key_values[i]
			mut probe_hash := h.probe_hash[i]
			original := u64(i - ((probe_hash>>hashbits) - 1)) & (h.range_cap>>1) 
			hash := original | (probe_hash<<h.shift)
			probe_hash = (probe_hash & hash_mask) | probe_inc
			mut index := hash & h.range_cap
			// While probe count is less
			for probe_hash < new_probe_hash[index] {
				index = (index + 1) & h.range_cap
				probe_hash += probe_inc
			}
			// Probe until an empty index is found.
			// Swap when probe count is higher/richer (Robin Hood).
			for new_probe_hash[index] != 0 {
				if probe_hash > new_probe_hash[index] {
					// Swap probe_hash
					tmp_probe_hash := new_probe_hash[index]
					new_probe_hash[index] = probe_hash
					probe_hash = tmp_probe_hash
					// Swap Kv
					tmp_kv := new_key_values[index]
					new_key_values[index] = kv
					kv = tmp_kv
				}
				index = (index + 1) & h.range_cap
				probe_hash += probe_inc
			}
			// Should almost never happen
			if (probe_hash & max_probe) == max_probe {
				h.expand()
				h.set(kv.key, kv.value)
				return
			}
			new_probe_hash[index] = probe_hash
			new_key_values[index] = kv
		}
	}
	unsafe{
		free(h.key_values)
	}
	h.key_values = new_key_values
	h.probe_hash = new_probe_hash
}

pub fn (h mut Hashmap) delete(key string) {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for probe_hash < h.probe_hash[index] {
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	// Perform backwards shifting
	for probe_hash == h.probe_hash[index] {
		if key == h.key_values[index].key {
			mut old_index := index
			index = (index + 1) & h.range_cap
			mut current_probe_hash := h.probe_hash[index]
			for (current_probe_hash>>hashbits) > 1 {
				h.probe_hash[old_index] = current_probe_hash - probe_inc
				h.key_values[old_index] = h.key_values[index]
				old_index = index
				index = (index + 1) & h.range_cap
				current_probe_hash = h.probe_hash[index]
			}
			h.probe_hash[old_index] = 0
			h.size--
			return
		}
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
}

pub fn (h Hashmap) get(key string) int {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for probe_hash < h.probe_hash[index] {
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	for probe_hash == h.probe_hash[index] {
		if key == h.key_values[index].key {
			return h.key_values[index].value
		}
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	return 0
}

pub fn (h Hashmap) exists(key string) bool {
	hash := wyhash.wyhash_c(key.str, u64(key.len), 0)
	mut index := hash & h.range_cap
	mut probe_hash := u32(((hash>>h.shift) & hash_mask) | probe_inc)
	for probe_hash < h.probe_hash[index] {
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	for probe_hash == h.probe_hash[index] {
		if key == h.key_values[index].key {
			return true
		}
		index = (index + 1) & h.range_cap
		probe_hash += probe_inc
	}
	return false
}

pub fn (h Hashmap) keys() []string {
	mut keys := [''].repeat(h.size)
	mut j := 0
	for i in 0 .. (h.range_cap + 1) {
		if h.probe_hash[i] != 0 {
			keys[j] = h.key_values[i].key
			j++
		}
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