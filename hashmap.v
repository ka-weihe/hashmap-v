const (
	initial_size = 2 << 3
	initial_cap = initial_size - 1
	load_factor = 0.5
	probe_offset = u16(1 << 8)
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

fn new_hmap() Hashmap {
	return Hashmap {
		info: &u16(malloc(sizeof(u16) * initial_size))
		key_values: &KeyValue(malloc(sizeof(KeyValue) * initial_size))
		cap: initial_cap
		elements: 0
	}
}

fn (h mut Hashmap) set(k string, v int) {
	if h.elements << 1 == h.cap - 1 { // load_factor 0.5
		h.rehash()
	}
	mut key := k
	mut value := v
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

	for (h.info[index] & 0xFF00) != 0 {
		if info > h.info[index] {
			tmp_kv := h.key_values[index] 
			tmp_info := h.info[index]
			h.key_values[index] = KeyValue{key, value}
			h.info[index] = info
			key = tmp_kv.key
			value = tmp_kv.value
			info = tmp_info

		}
		index = (index + 1) & h.cap
		info += probe_offset
	}

	h.info[index] = info
	h.key_values[index] = KeyValue{key, value}
	h.elements++
}

fn (h mut Hashmap) rehash() {
	old_cap := h.cap
	h.cap = ((h.cap + 1) << 1) - 1
	mut new_info := &u16(malloc(sizeof(u16) * (h.cap + 1)))
	mut new_key_values := &KeyValue(malloc(sizeof(KeyValue) * (h.cap + 1)))

	for i := 0; i <= old_cap; i++ {
		if h.key_values[i].key.str != 0 {
				mut key := h.key_values[i].key
				mut value := h.key_values[i].value
				hash := fnv1a64(key)
				mut info := u16((hash >> 56) | probe_offset)
				mut index := hash & h.cap

				for info < new_info[index] {
					index = (index + 1) & h.cap
					info += probe_offset
				}

				for (new_info[index] & 0xFF00) != 0 {
					if info > new_info[index] {
						tmp_kv := new_key_values[index] 
						tmp_info := new_info[index]
						new_key_values[index] = KeyValue{key, value}
						new_info[index] = info
						key = tmp_kv.key
						value = tmp_kv.value
						info = tmp_info

					}
					index = (index + 1) & h.cap
					info += probe_offset
				}

				new_info[index] = info
				new_key_values[index] = KeyValue{key, value}
		}
	}
	h.info = new_info
	h.key_values = new_key_values
}

fn (h Hashmap) get(key string) int {
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

fn test() {
	mut m := new_hmap()
	for i in 1..1000000 {
		m.set(i.str(), i)
	}
	for i in 1..1000000 {
		m.set(i.str(), i)
	}

	for i in 1..1000000 {
		// println(i)
		assert m.get(i.str()) == i
	}
}

fn main() {
	test()
	// mut m := new_hmap()
	// m.set("2", 2)
	// println(m.get("2"))
	// m.set("2", 1)


	// // m.set("1", 1)
	// // println(m.get("1"))
	// // mut i := 1

	// m.clear()
	// println(m.get("4"))
	// println(m.get("2"))
	// probe_count := 1
	// probe_hash := (u64(hash) & 0xFFFFFFFFFFFFFFF) | (u64(1) << 60)
	// probe_count_a := probe_hash >> 60
	// println(probe_hash)
	// // println(hash)
	// // println(probe_count_a)
}

