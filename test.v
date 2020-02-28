import hashmap
import rand
import time 

// A lot of dublicate tests
fn test1() {
	rand.seed(time.now().unix)
	mut m := hashmap.new_hmap()
	for i in 1..100000 {
		m.set(i.str(), i)
	}
	for i in 1..100000 {
		m.set(i.str(), i + 1)
	}

	for i in 1..100000 {
		// start_time := time.ticks()
		// 
		assert m.get(i.str()) == (i + 1)
	}
}

fn test2() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..80000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..80000 {
		assert i == b.get(arr[i]) 
	}
}

fn test3() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int
	for i in 0..80000 {
		mut buf := []byte
		for j in 0..5 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		c[s] = i
		arr << s
	}
	for i in 0..80000 {
		assert c[arr[i]] == b.get(arr[i]) 
	}
}


fn test4() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int
	for i in 0..80000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		c[s] = i
		arr << s
	}
	for i in 0..80000 {
		assert c[arr[i]] == b.get(arr[i]) 
	}
}

fn test5() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..100000 {
		// println(i)
		b.delete(arr[i])
		assert b.get(arr[i]) == 0 
	}
	assert b.size == 0
}

fn test6() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..100000 {
		// println(i)
		b.delete(arr[i])
		assert b.get(arr[i]) == 0 
	}

	for i in 0..100000 {
		b.set(arr[i], i)
	}

	for i in 0..100000 {
		assert b.get(arr[i]) == i
	}

	keys1 := b.keys()
	for i in 0..1000 {
		assert arr[i] in keys1
	}

	for i in 0..100000 {
		b.delete(arr[i])
	}

	for i in 0..100000 {
		assert b.get(arr[i]) == 0
	}

	assert b.size == 0
}

fn test7() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int

	for _ in 0..10 {
		for i in 0..10000 {
			mut buf := []byte
			for j in 0..5 {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)
			b.set(s, i)
			c[s] = i
			arr << s
		}

		for i in 0..10000 {
			// println(c.size)
			assert c.size == b.size
			assert c[arr[i]] == b.get(arr[i])
			c.delete(arr[i])
			b.delete(arr[i])

			mut buf := []byte
			for j in 0..5 {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)

			c.delete(s)
			b.delete(s)
		}
	}
	
	// assert c.keys().len == b.keys().len
	assert c.size == b.size
}

fn test8() {
	
}

fn rnd_test_get() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..100000 {
		assert i == b.get(arr[i]) 
	}
}

fn rnd_test_delete() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		mut buf := []byte
		for j in 0..15 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..100000 {
		// println(i)
		b.delete(arr[i])
		assert b.get(arr[i]) == 0
	}
	assert b.size == 0 
}

fn rnd_test_exists() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		mut buf := []byte
		for j in 0..5 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		arr << s
	}
	for i in 0..100000 {
		// println(i)
		b.delete(arr[i])
		b.exists(arr[i])
	}
	// println(b.size)
	// assert b.size == 0 
}

fn test_vs_map1() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int
	for i in 0..240000 {
		mut buf := []byte
		for j in 0..4 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		s := string(buf)
		b.set(s, i)
		c[s] = i
		arr << s
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

	for i in 0..240000 {
		b.delete(arr[i])
		c.delete(arr[i])
	}

	assert b.keys().len == c.keys().len
	assert b.size == c.size
}

fn test_vs_map2() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int

	for _ in 0..10 {
		for i in 0..10000 {
			mut buf := []byte
			for j in 0..5 {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)
			b.set(s, i)
			c[s] = i
			arr << s
		}

		for i in 0..10000 {
			assert c.size == b.size
			assert c[arr[i]] == b.get(arr[i])
			c.delete(arr[i])
			b.delete(arr[i])

			mut buf := []byte
			for j in 0..5 {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)

			c.delete(s)
			b.delete(s)
		}
	}
	
	assert c.keys().len == b.keys().len
	assert c.size == b.size
}

fn test_vs_map3() {
	mut arr := []string
	mut b := hashmap.new_hmap()
	mut c := map[string]int
	for i in 0..4000 {
		mut buf := []byte
		for j in 0..4 {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		
		s := string(buf)

		b.set(s, i)
		c[s] = i
		arr << s
	}

	for i in 0..4000 {
		assert c.keys().len == b.keys().len
		assert c.size == b.size
		assert c[arr[i]] == b.get(arr[i])
		c.delete(arr[i])
		b.delete(arr[i])
	}
	assert c.keys().len == b.keys().len
	assert c.size == b.size
}

fn general_test1() {
	mut m := hashmap.new_hmap()
	assert m.size == 0
	m.set('hi', 80)
	m.set('hello', 101)
	assert m.get('hi') == 80
	assert m.get('hello') == 101
	assert m.exists('hi')
	assert m.exists('hello')
	assert m.size == 2
	keys := m.keys()
	assert keys.len == 2
	m.delete('hi')
	assert m.size == 1
	m.delete('aloha')
	assert m.size == 1
	assert m.exists('hi') == false
	assert m.get('hi') == 0
	assert m.keys().len == 1
}

fn general_test2() {
	mut m := hashmap.new_hmap()
	m.set('hi', 12)
	m.delete('hi')
	m.set('hi', 1233)
	m.delete('his')
	assert m.size == 1
	assert m.exists('hi')
	assert m.exists('his') == false
	assert m.get('hi') == 1233
	assert m.keys().len == 1
	assert m.keys()[0] == 'hi'
	assert m.get('hello') == 0
	assert m.exists('hello') == false
	m.set('hi', 1)
	assert m.get('hi') == 1
	m.set('hi', 2)
	assert m.get('hi') == 2
}

fn test_large_map() {
	mut nums := hashmap.new_hmap()
	N := 30 * 1000
	for i := 0; i < N; i++ {
	key := i.str()
		nums.set(key, i)
	}
	assert nums.get('1') == 1
	assert nums.get('999') == 999
	assert nums.get('1500') == 1500
	assert nums.get('10000') == 10000
	assert nums.get('1000000') == 0
}

fn test_delete() {
	mut m := hashmap.new_hmap()
	m.set('one', 1)
	m.set('two', 2)
	m.delete('two')
	assert m.exists('two') == false
	assert m.exists('one')
	assert m.exists('three') == false
	assert m.size == 1
	m.delete('aloha')
	assert m.size == 1
	m.delete('one')
	assert m.size == 0
}	


fn test_exists() {
	mut m := hashmap.new_hmap()
	m.set('one', 1)
	m.set('two', 2)
	m.set('three', 2)
	m.set('four', 2)
	m.set('five', 2)
	assert m.exists('aloha') == false
	assert m.exists('two')
	assert m.exists('what') == false
	assert m.exists('three')
	assert m.exists('hi') == false
	assert m.exists('four')
	assert m.exists('hello') == false
	assert m.exists('five')
	assert m.exists('welcome') == false
	assert m.exists('one')
	m.delete('one')
	assert m.exists('one') == false
	m.delete('two')
	assert m.exists('two') == false
	m.delete('three')
	assert m.exists('three') == false
	m.delete('four')
	assert m.exists('four') == false
	m.delete('five')
	assert m.exists('five') == false
	assert m.size == 0
}


fn main() {
	test1()
	test2()
	test3()
	test4()
	test5()
	test6()
	test7()
	rnd_test_get()
	rnd_test_delete()
	general_test1()
	general_test2()
	test_large_map()
	test_delete()
	test_exists()
	rnd_test_exists()
	test_vs_map1()
	test_vs_map2()
	test_vs_map3()
	// println(-1 & 1)
	// test3()
	// mut m := hashmap.new_hmap()
	// m.set("hej", 1)
	// m.delete("hej")
	// a := m.keys()
	// println(a.data[0])
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
