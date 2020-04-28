struct Kv {
	key   string
mut:
	value int
}

struct DenseArr {
mut:
	data &Kv
	cap  u32
	size u32
}

[inline]
fn new_dense_arr() DenseArr {
	unsafe {
		return DenseArr {
			data: &Kv(malloc(8 * sizeof(Kv)))
			cap: 8
			size: 0
		}
	}
}

// Push element to array and return index
// The growth-factor is roughly 12.5 `(x + (x >> 3))`
[inline]
fn (d mut DenseArr) push(value Kv) u32 {
	if d.cap == d.size {
		d.cap += d.cap >> 3
		d.data = &Kv(C.realloc(d.data, sizeof(Kv) * d.cap))
	}
	push_index := d.size
	d.data[push_index] = value
	d.size++
	return push_index
}

// Move all zero-elements to the end of the array
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
	println(d.size)
	d.cap = if count <= 8 {8} else {count}
	d.data = &Kv(C.realloc(d.data, sizeof(Kv) * d.cap))
}

fn main() {
	for _ in 0..10 {
		mut a := new_dense_arr()
		for i in 0..1000000 {
			a.push(Kv{i.str(), i})
		}

		for i := 0; i < 999999; i++ {
			memset(&a.data[i], 0, sizeof(Kv))
		}

		a.zeros_to_end()
	}
}