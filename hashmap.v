const (
	initial_size = 2 << 25
	initial_cap = initial_size - 1
	load_factor = 0.5
	probe_bitmask = 0xFFFFFFFFFFFFFFF
)

struct Hashmap {
mut:
	probe_hash &u64
	key_values &KeyValue
	cap        int
	elements   int
}

struct KeyValue {
	key   string
mut:
	value int
}

fn new_hmap() Hashmap {
	return Hashmap {
		probe_hash: &u64(malloc(sizeof(u64) * initial_size))
		key_values: &KeyValue(malloc(sizeof(KeyValue) * initial_size))
		cap: initial_cap
		elements: 0
	}
}

fn (h mut Hashmap) set(key string, value int) {
	if h.elements << 1 == h.cap - 1 { // load_factor 0.5
		h.rehash()
	}
	hash := key.hash()
	mut current_psl := byte(0)
	mut current_key_value := KeyValue{key, value}
	mut current_probe_hash := (u64(hash) & probe_bitmask) | (u64(0) << 60)
	mut index := current_probe_hash & h.cap
	for h.key_values[index].key.str != 0 {
		if h.key_values[index].key == key {
			h.key_values[index].value = value
			return
		}
		if (h.probe_hash[index] >> 60) < current_psl {
			tmp_probe_hash := h.probe_hash[index]
			tmp_key_value := h.key_values[index]
			h.probe_hash[index] = (current_probe_hash & probe_bitmask) | (u64(current_psl) << 60)
			h.key_values[index] = current_key_value
			current_psl = byte(tmp_probe_hash >> 60)
			current_probe_hash = tmp_probe_hash
			current_key_value = tmp_key_value
		}
		current_psl++
		index = (index + 1) & h.cap
	}
	h.probe_hash[index] = (current_probe_hash & probe_bitmask) | (u64(current_psl) << 60)
	h.key_values[index] = current_key_value
	h.elements++
}

fn (h Hashmap) rehash() {
	// old_cap := h.cap
	// h.cap = ((h.cap + 1) << 1) - 1
	// mut new_keys := &string(malloc(sizeof(string) * (h.cap + 1)))
	// mut new_values := &int(malloc(sizeof(int) * (h.cap + 1)))
	// mut new_probe_hash := &u64(malloc(sizeof(u64) * (h.cap + 1)))
	
	// for i := 0; i <= old_cap; i++ {
	// 	if h.keys[i].str != 0 {
	// 		mut current_psl := byte(0)
	// 		mut current_key := h.keys[i]
	// 		mut current_value := h.values[i]
	// 		mut current_probe_hash := h.probe_hash[i]
	// 		mut index := current_key.hash() & h.cap
	// 		for new_keys[index].str != 0 {
	// 			if (new_probe_hash[index] >> 60) < current_psl {
	// 				tmp_key := new_keys[index]
	// 				tmp_value := new_values[index]
	// 				tmp_probe_hash := new_probe_hash[index]
	// 				tmp_psl := byte(tmp_probe_hash >> 60)
	// 				new_keys[index] = current_key
	// 				new_values[index] = current_value
	// 				new_probe_hash[index] = (current_probe_hash & probe_bitmask) | (u64(current_psl) << 60)
	// 				current_key = tmp_key
	// 				current_psl = tmp_psl
	// 				current_value = tmp_value
	// 				current_probe_hash = tmp_probe_hash
	// 			}
	// 			current_psl++
	// 			index = (index + 1) & h.cap
	// 		}
	// 		new_keys[index] = current_key
	// 		new_values[index] = current_value
	// 		new_probe_hash[index] = (current_probe_hash & probe_bitmask) | (u64(current_psl) << 60)
	// 	}
	// }
	// // free(h.keys)
	// // free(h.values)
	// // free(h.probe_count)
	// h.keys = new_keys
	// h.values = new_values
	// h.probe_hash = new_probe_hash
}

fn (h Hashmap) get(key string) int {
	hash := key.hash()
	mut index := hash & h.cap
	for key != h.key_values[index].key {
		if h.key_values[index].key.str == 0 {
			return 0
		}
		index = (index + 1) & h.cap
	}
	return h.key_values[index].value
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
	// m.set("2", 1)


	// // m.set("1", 1)
	// // println(m.get("1"))
	// // mut i := 1

	// m.clear()
	// println(m.get("4"))
	// println(m.get("2"))
	// somestr := "hej"
	// hash := somestr.hash()

	// probe_count := 1
	// probe_hash := (u64(hash) & 0xFFFFFFFFFFFFFFF) | (u64(1) << 60)
	// probe_count_a := probe_hash >> 60
	// println(probe_hash)
	// // println(hash)
	// // println(probe_count_a)
}

