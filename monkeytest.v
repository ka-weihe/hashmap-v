import hashmap
import btree
import rand
import time

fn generate_strings(len, amount int) &string {
	mut arr := &string(malloc(sizeof(string) * amount))
	for i in 0..amount {
		mut buf := &byte(vcalloc(sizeof(byte) * (len + 1) ))
		for j in 0..len {
			buf[j] = byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		arr[i] = string(buf)
	}
	return arr
}

fn test_1() {
	amount := 200000 - rand.next(100000)
	amount2 := 200000 - rand.next(100000)
	len := 20 - rand.next(6)
	arr := generate_strings(len, amount)
	arr2 := generate_strings(len, amount2)
	mut b := hashmap.new_hmap()
	for i in 0..amount {
		b.set(arr[i], i)
		assert i == b.get(arr[i]) 
	}
	for i in 0..amount {
		assert i == b.get(arr[i]) 
	}
	for i in 0..amount2 {
		assert 0 == b.get(arr2[i])
	}
	b.free()
}

fn test_2() {
	for x in 1..4 {
		amount := 120000 - rand.next(70000)
		arr := generate_strings(x * 5, amount)
		mut b := hashmap.new_hmap()
		// b.expand()
		b.reserve(amount)
		// println(b.cap)
		// mut c := btree.new_tree()
		for i in 0..amount {
			b.set(arr[i], i)
			// c.set(arr[i], i)
			b.get(arr[i]) 
		}
		for i in 0..amount {
			b.get(arr[i]) 
		}
		b.free()
	}	
}

fn test_3() {
	amount := 200000 - rand.next(100000)
	len := 20 - rand.next(6)
	arr := generate_strings(len, amount)
	mut b := hashmap.new_hmap()
	for i in 0..amount {
		b.set(arr[i], i)
	}
	for i in 0..amount {
		b.delete(arr[i])
		assert b.get(arr[i]) == 0 
	}
	assert b.size == 0
	b.free()
}

fn test_4() {
	amount := 200000 - rand.next(100000)
	len := 20 - rand.next(6)
	arr := generate_strings(len, amount)
	mut b := hashmap.new_hmap()
	for _ in 0..10 {
		for i in 0..amount {
			b.set(arr[i], i)
		}
		for i in 0..amount {
			assert b.size == amount - i
			b.delete(arr[i])
			assert b.get(arr[i]) == 0 
		}
		for i in 0..amount {
			b.set(arr[i], i)
			assert b.get(arr[i]) == i
		}
		for i in 0..amount {
			assert b.get(arr[i]) == i
		}
		keys1 := b.keys()
		for i in 0..1000 {
			assert arr[i] in keys1
		}
		for i in 0..amount {
			b.delete(arr[i])
			assert b.get(arr[i]) == 0
		}
		for i in 0..amount {
			assert b.get(arr[i]) == 0
		}
		assert b.size == 0
	}
	b.free()
}

fn test_5() {
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for _ in 0..10 {
		amount := 30000 - rand.next(20000)
		arr := generate_strings(5, amount)
		for i in 0..amount {
			b.set(arr[i], i)
			c.set(arr[i], i)
		}
		for i in 0..amount {
			assert c.size == b.size
			assert c.get(arr[i]) == b.get(arr[i])
			c.delete(arr[i])
			b.delete(arr[i])
			mut buf := &byte(vcalloc(6))
			for j in 0..5 {
				buf[j] = byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			buf[5] = 0
			s := string(buf)
			c.delete(s)
			b.delete(s)
		}
	}
	assert c.keys().len == b.keys().len
	assert c.size == b.size
	b.free()
}

fn test_6() {
	amount := 180000 - rand.next(130000)
	arr := generate_strings(5, amount)
	mut b := hashmap.new_hmap()
	for i in 0..amount {
		b.set(arr[i], i)
	}
	for i in 0..amount {
		b.delete(arr[i])
		b.exists(arr[i])
	}
	assert b.size == 0 
	b.free()
}

fn test_7() {
	amount := 400000 - rand.next(150000)
	arr := generate_strings(5, amount)
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for i in 0..amount {
		b.set(arr[i], i)
		c.set(arr[i], i)
	}
	mut arr1 := b.keys()
	arr1.sort()
	mut arr2 := c.keys()
	arr2.sort()
	for i in 0..arr1.len - 1 {
		assert arr2[i] == arr2[i]
	}
	assert b.keys().len == c.keys().len
	assert b.size == c.size
	for i in 0..amount {
		b.delete(arr[i])
		c.delete(arr[i])
	}
	assert b.keys().len == c.keys().len
	assert b.size == c.size
	b.free()
}

fn test_8() {
	amount := rand.next(8000)
	arr := generate_strings(5, amount)
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for i in 0..amount {
		b.set(arr[i], i)
		c.set(arr[i], i)
	}
	for i in 0..amount {
		assert c.keys().len == b.keys().len
		assert c.size == b.size
		assert c.get(arr[i]) == b.get(arr[i])
		c.delete(arr[i])
		b.delete(arr[i])
	}
	assert c.keys().len == b.keys().len
	assert c.size == b.size
	b.free()
}

fn test_9() {
	amount := rand.next(50000)
	len := 20 - rand.next(6)
	mut b := hashmap.new_hmap()
	arr := generate_strings(len, amount)
	for _ in 0..10 {
		for i in 0..amount {
			b.set(arr[i], i)
		}
		keys := b.keys()

		for i in 0..amount {
			assert keys[i] == arr[i]
		}

		for i in 0..amount {
			b.delete(arr[i])
		}
		assert b.size == 0
		keys.free()
	}
	b.free()
}

fn main() {
	for _ in 0..2 {
		seed := int(time.ticks())
		rand.seed(seed)
		println('$seed.hex()')
		// test_1()
		test_2()
		// test_3()
		// test_4()
		// test_5()
		// test_6()
		// test_7()
		// test_8()
		// test_9()
	}
}