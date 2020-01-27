// Copyright (c) 2019 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module hashmap

const (
	initial_size = 2 << 4
	initial_cap = initial_size - 1
	probe_offset = u16(256)
	load_factor = 0.8
)

// hash-function should not be in this file
const (
	fnv64_prime = 1099511628211
	fnv64_offset_basis = 14695981039346656037
	fnv32_offset_basis = u32(2166136261)
	fnv32_prime = u32(16777619)
)


pub struct Hashmap {
mut:
	info        &u16
	key_values  &KeyValue
	cap         int
pub mut:
	load_factor f32
	size        int
}

struct KeyValue {
	key   string
mut:
	value int
}

[inline]
fn fnv1a64(data string) u64 {
	mut hash := fnv64_offset_basis
	for i := 0; i < data.len; i++ {
		hash = (hash ^ u64(data[i])) * fnv64_prime
	}
	return hash
}

pub fn new_hmap() Hashmap {
	return Hashmap{
		info: &u16(calloc(sizeof(u16) * initial_size))
		key_values: &KeyValue(calloc(sizeof(KeyValue) * initial_size))
		cap: initial_cap
		load_factor: 0.8
		size: 0
	}
}

pub fn (h mut Hashmap) set(key string, value int) {
	// The load factor is 0.5.
	// It will be adjustable  in the future and with
	// a higher default settings to lower memory usage.
	if (f32(h.size) / f32(h.cap)) > h.load_factor {
		h.rehash()
	}
	// if (h.size << 1) == (h.cap - 1) {
	// 	h.rehash()
	// }

	// Hash-function will be swapped for wyhash
	hash := fnv1a64(key)
	mut info := u16((hash >> 56) | probe_offset)
	mut index := hash & h.cap
	// While probe count is less
	for info < h.info[index] {
		index = (index + 1) & h.cap
		info += probe_offset
	}
	// While we might have a match
	for info == h.info[index] {
		if key == h.key_values[index].key {
			h.key_values[index].value = value
			return
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}
	// Match is not possible anymore.
	// Probe until an empty index is found.
	// Swap when probe count is higher/richer (Robin Hood).
	mut current_kv := KeyValue{key, value}
	for h.info[index] != 0 {
		if info > h.info[index] {
			// Swap info word
			tmp_info := h.info[index]
			h.info[index] = info
			info = tmp_info
			// Swap KeyValue
			tmp_kv := h.key_values[index] 
			h.key_values[index] = current_kv
			current_kv = tmp_kv
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}
	// Should almost never happen
	if (info & 0xFF00) == 0xFF00 {
		h.rehash()
		h.set(current_kv.key, current_kv.value)
		return
	}
	h.info[index] = info
	h.key_values[index] = current_kv
	h.size++
}

fn (h mut Hashmap) rehash() {
	old_cap := h.cap
	h.cap = ((h.cap + 1) << 1) - 1
	mut new_key_values := &KeyValue(calloc(sizeof(KeyValue) * (h.cap + 1)))
	mut new_info := &u16(calloc(sizeof(u16) * (h.cap + 1)))
	for i in 0 .. (old_cap + 1) {
		if h.info[i] != 0 {
			mut kv := h.key_values[i]
			hash := fnv1a64(kv.key)
			mut info := u16((hash >> 56) | probe_offset)
			mut index := hash & h.cap
			// While probe count is less
			for info < new_info[index] {
				index = (index + 1) & h.cap
				info += probe_offset
			}
			// Probe until an empty index is found.
			// Swap when probe count is higher/richer (Robin Hood).
			for new_info[index] != 0 {
				if info > new_info[index] {
					// Swap info word
					tmp_info := new_info[index]
					new_info[index] = info
					info = tmp_info
					// Swap KeyValue
					tmp_kv := new_key_values[index] 
					new_key_values[index] = kv
					kv = tmp_kv
				}
				index = (index + 1) & h.cap
				info += probe_offset
			}
			// Should almost never happen
			if (info & 0xFF00) == 0xFF00 {
				h.rehash()
				h.set(kv.key, kv.value)
				return
			}
			new_info[index] = info
			new_key_values[index] = kv
		}
	}
	h.key_values = new_key_values
	h.info = new_info
}

pub fn (h mut Hashmap) delete(key string) {
	hash := fnv1a64(key)
	mut index := hash & h.cap
	mut info := u16((hash >> 56) | probe_offset)
	for info < h.info[index] {
		index = (index + 1) & h.cap
		info += probe_offset
	}
	// Perform backwards shifting
	for info == h.info[index] {
		if key == h.key_values[index].key {
			mut old_index := index
			index = (index + 1) & h.cap
			mut current_info := h.info[index]
			for (current_info >> 8) > 1 {
				h.info[old_index] = current_info - probe_offset
				h.key_values[old_index] = h.key_values[index]
				old_index = index
				index = (index + 1) & h.cap
				current_info = h.info[index]
			}
			h.info[old_index] = 0
			h.size--
			return
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}
}

pub fn (h Hashmap) get(key string) int {
	hash := fnv1a64(key)
	mut index := hash & h.cap
	mut info := u16((hash >> 56) | probe_offset)
	for info < h.info[index] {
		index = (index + 1) & h.cap
		info += probe_offset
	}
	for info == h.info[index] {
		if key == h.key_values[index].key {
			return h.key_values[index].value
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}
	return 0
}

pub fn (h Hashmap) exists(key string) bool {
	hash := fnv1a64(key)
	mut index := hash & h.cap
	mut info := u16((hash >> 56) | probe_offset)
	for info < h.info[index] {
		index = (index + 1) & h.cap
		info += probe_offset
	}
	for info == h.info[index] {
		if key == h.key_values[index].key {
			return true
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}
	return false
}

pub fn (h Hashmap) keys() []string {
	mut keys := [''].repeat(h.size)
	mut j := 0
	for i in 0 .. (h.cap + 1) {
		if h.info[i] != 0 {
			keys[j] = h.key_values[i].key
			j++
		}
	}
	return keys
}
