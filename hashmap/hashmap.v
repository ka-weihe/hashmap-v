module hashmap

const (
	initial_size = 2 << 8
	initial_cap = initial_size - 1
	load_factor = 0.5
	probe_offset = u16(256)
)

const(
	fnv64_prime        = 1099511628211
	fnv64_offset_basis = 14695981039346656037
)

const(
    fnv32_offset_basis = u32(2166136261)
    fnv32_prime        = u32(16777619)
)


struct Hashmap {
mut:
	info &u16
	key_values &KeyValue
	cap        int
	elements   int
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
	return Hashmap {
		info: &u16(calloc(sizeof(u16) * initial_size))
		key_values: &KeyValue(calloc(sizeof(KeyValue) * initial_size))
		cap: initial_cap
		elements: 0
	}
}

pub fn (h mut Hashmap) set(key string, value int) {
	// load_factor 0.5
	if (h.elements << 1) == (h.cap - 1) { 
		h.rehash()
	}

	hash := fnv1a64(key)
	mut info := u16((hash >> 56) | probe_offset)
	mut index := hash & h.cap

	for info < h.info[index] {
		index = (index + 1) & h.cap
		info += probe_offset
	}

	for info == h.info[index] {
		if key == h.key_values[index].key {
			h.key_values[index].value = value
			return
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}

	mut current_key := key
	mut current_value := value
	for h.info[index] != 0 {
		if info > h.info[index] {
			tmp_kv := h.key_values[index] 
			tmp_info := h.info[index]
			h.key_values[index] = KeyValue{current_key, current_value}
			h.info[index] = info
			current_key = tmp_kv.key
			current_value = tmp_kv.value
			info = tmp_info
		}
		index = (index + 1) & h.cap
		info += probe_offset
	}

	if (info & 0xFF00) == 0xFF00 {
		h.rehash()
		h.set(current_key, current_value)
		return
	}

	h.info[index] = info
	h.key_values[index] = KeyValue{current_key, current_value}
	h.elements++
}

fn (h mut Hashmap) rehash() {
	old_cap := h.cap
	h.cap = ((h.cap + 1) << 1) - 1
	h.elements = 0
	old_key_values :=  h.key_values
	h.info = &u16(calloc(sizeof(u16) * (h.cap + 1)))
	h.key_values = &KeyValue(calloc(sizeof(KeyValue) * (h.cap + 1)))
	for i in 0..(old_cap + 1) {
		if !isnil(old_key_values[i].key.str) {
			h.set(old_key_values[i].key, old_key_values[i].value)
		}
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


