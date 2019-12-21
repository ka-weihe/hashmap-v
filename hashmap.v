const (
	initial_size = 2 << 2
	load_factor = 0.5
	bit_mask = initial_size - 1
	nilstr = string(malloc(sizeof(string)))
)

struct Hashmap {
mut:
	psls     &byte
	keys     &string
	values   &int
	size     int
	elements int
}

fn new_hmap() Hashmap {
	return Hashmap {
		psls: &byte(malloc(sizeof(byte) * initial_size))
		keys: &string(malloc(sizeof(string) * initial_size))
		values: &int(malloc(sizeof(int) * initial_size))
		size: initial_size
		elements: 0
	}
}

fn (h mut Hashmap) set(key string, value int) {
	if (h.elements) << 1 == h.size { // load_factor 0.5
		h.rehash()
	}
	hash := key.hash()
	mut current_psl := byte(0)
	mut current_key := key
	mut current_value := value
	mut index := hash & (h.size - 1)
	for h.keys[index].str != 0 {
		if h.keys[index] == key {
			h.values[index] = current_value
			return
		}
		if h.psls[index] < current_psl {
			tmp_key := h.keys[index]
			tmp_psl := h.psls[index]
			tmp_value := h.values[index]
			h.keys[index] = current_key
			h.psls[index] = current_psl
			h.values[index] = current_value
			current_key = tmp_key
			current_psl = tmp_psl
			current_value = tmp_value
		}
		current_psl++
		index = (index + 1) & (h.size - 1)
	}
	h.keys[index] = current_key
	h.values[index] = current_value
	h.psls[index] = current_psl
	h.elements++
}

fn (h mut Hashmap) rehash() {
	old_size := h.size
	h.size = h.size << 1
	mut new_psls := &byte(malloc(sizeof(byte) * h.size))
	mut new_keys := &string(malloc(sizeof(string) * h.size))
	mut new_values := &int(malloc(sizeof(int) * h.size))
	
	for i := 0; i < old_size; i++ {
		if h.keys[i].str != 0 {
			mut current_psl := byte(0)
			mut current_key := h.keys[i]
			mut current_value := h.values[i]
			hash := current_key.hash()
			mut index := hash & (h.size - 1)
			for new_keys[index].str != 0 {
				if new_psls[index] < current_psl {
					tmp_key := new_keys[index]
					tmp_psl := new_psls[index]
					tmp_value := new_values[index]
					new_keys[index] = current_key
					new_psls[index] = current_psl
					new_values[index] = current_value
					current_key = tmp_key
					current_psl = tmp_psl
					current_value = tmp_value
				}
				current_psl++
				index = (index + 1) & (h.size - 1)
			}
			new_keys[index] = current_key
			new_values[index] = current_value
			new_psls[index] = current_psl
		}
	}
	// free(h.keys)
	// free(h.values)
	// free(h.probe_count)
	h.psls = new_psls
	h.keys = new_keys
	h.values = new_values
}

fn (h Hashmap) get(key string) int {
	hash := key.hash()
	mut index := hash & (h.size - 1)
	for key != h.keys[index] {
		if h.keys[index].str == 0 {
			return 0
		}
		index = (index + 1) & (h.size - 1)
	}
	return h.values[index]
}

fn test() {
	mut m := new_hmap()
	for i in 1..10000 {
		m.set(i.str(), i)
	}

	// for i in 1..10000 {
	// 	// println(i)
	// 	assert m.get(i.str()) == i
	// }
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

	
}

