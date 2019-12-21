const (
	initial_size = 2 << 3
	load_factor = 0.5
	bit_mask = initial_size - 1
	nilstr = string(malloc(sizeof(string)))
)

struct Hashmap {
mut:
	keys        &string
	values      &int
	size        int
	elements    int
}

fn new_hmap() Hashmap {
	return Hashmap {
		keys: &string(malloc(sizeof(string) * initial_size))
		values: &int(malloc(sizeof(int) * initial_size))
		size: initial_size
		elements: 0
	}
}


fn hsh(str byteptr) int {
	mut h := 0
	for i := 0; str[i] != 0; i++ {
		h = h * 31 + int(str[i])
	} 
	return h
}

fn (h mut Hashmap) set(key string, value int) {
	if (h.elements + 1) << 1 == h.size {
		h.grow(key, value)
		return
	}
	hash := key.hash()
	mut index := hash & (h.size - 1)
	for h.keys[index].str != 0 {
		if h.keys[index] == key {
			h.values[index] = value
			return
		}
		index = (index + 1) & (h.size - 1)
	}
	h.keys[index] = key
	h.values[index] = value
	h.elements++
}

fn (h mut Hashmap) rehash(key string, value int) {
	hash := key.hash()
	mut index := hash & (h.size - 1)
	for h.keys[index].str != 0 {
		index = (index + 1) & (h.size - 1)
	}
	h.keys[index] = key
	h.values[index] = value
}

fn (h mut Hashmap) grow(key string, value int) {
	old_size := h.size
	h.size = h.size << 1
	mut new_keys := &string(malloc(sizeof(string) * h.size))
	mut new_values := &int(malloc(sizeof(int) * h.size))

	for i := 0; i < old_size; i++ {
		if h.keys[i].str != 0 {
			tmp_key := h.keys[i]
			tmp_value := h.values[i]
			hash := tmp_key.hash()
			mut index := hash & (h.size - 1)
			for new_keys[index].str != 0 {
				index = (index + 1) & (h.size - 1)
			}
			new_keys[index] = tmp_key
			new_values[index] = tmp_value
		}
	}
	h.keys = new_keys
	h.values = new_values
	h.elements++
	h.rehash(key, value)
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


fn main() {
	mut m := new_hmap()
	// // m.set("2", 2)


	// // m.set("1", 1)
	// // println(m.get("1"))
	// // mut i := 1
	for i in 1..100000 {
		m.set(i.str(), i)
	}
	// m.clear()
	// println(m.get("4"))
	// println(m.get("2"))

	for i in 1..100000 {
		println(i)
		assert m.get(i.str()) == i
	}
}

