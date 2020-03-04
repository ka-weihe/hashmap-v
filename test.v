import hashmap
import btree
import rand
import time

fn generate_strings(len, amount int) []string {
	mut arr := []string
	for _ in 0..amount {
		mut buf := []byte
		for _ in 0..len {
			buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		arr << string(buf)
	}
	return arr
}

fn test_1() {
	mut m := hashmap.new_hmap()
	for i in 1..1000000 {
		m.set(i.str(), i)
	}
	for i in 1..1000000 {
		m.set(i.str(), i + 1)
	}
	for i in 1..1000000 {
		assert m.get(i.str()) == (i + 1)
	}
	m.free()
}

fn test_2() {
	arr := generate_strings(15, 80000)
	mut b := hashmap.new_hmap()
	for i in 0..80000 {
		b.set(arr[i], i)
		assert i == b.get(arr[i]) 
	}
	for i in 0..80000 {
		assert i == b.get(arr[i]) 
	}
}

fn test_3() {
	for x in 1..4 {
		arr := generate_strings(x * 5, 80000)
		mut b := hashmap.new_hmap()
		mut c := btree.new_tree()
		for i in 0..80000 {
			b.set(arr[i], i)
			c.set(arr[i], i)
			assert c.get(arr[i]) == b.get(arr[i]) 
		}
		for i in 0..80000 {
			assert c.get(arr[i]) == b.get(arr[i]) 
		}
	}	
}

fn test_4() {
	arr := generate_strings(15, 100000)
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		b.set(arr[i], i)
	}
	for i in 0..100000 {
		b.delete(arr[i])
		assert b.get(arr[i]) == 0 
	}
	assert b.size == 0
}

fn test_5() {
	arr := generate_strings(15, 100000)
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		b.set(arr[i], i)
	}
	for i in 0..100000 {
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

fn test_6() {
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for _ in 0..10 {
		arr := generate_strings(5, 10000)
		for i in 0..10000 {
			b.set(arr[i], i)
			c.set(arr[i], i)
		}
		for i in 0..10000 {
			assert c.size == b.size
			assert c.get(arr[i]) == b.get(arr[i])
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

fn test_7() {
	arr := generate_strings(5, 100000)
	mut b := hashmap.new_hmap()
	for i in 0..100000 {
		b.set(arr[i], i)
	}
	for i in 0..100000 {
		b.delete(arr[i])
		b.exists(arr[i])
	}
	assert b.size == 0 
}

fn test_8() {
	arr := generate_strings(5, 240000)
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for i in 0..240000 {
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
	for i in 0..240000 {
		b.delete(arr[i])
		c.delete(arr[i])
	}
	assert b.keys().len == c.keys().len
	assert b.size == c.size
}

fn test_9() {
	arr := generate_strings(5, 4000)
	mut b := hashmap.new_hmap()
	mut c := btree.new_tree()
	for i in 0..4000 {
		b.set(arr[i], i)
		c.set(arr[i], i)
	}
	for i in 0..4000 {
		assert c.keys().len == b.keys().len
		assert c.size == b.size
		assert c.get(arr[i]) == b.get(arr[i])
		c.delete(arr[i])
		b.delete(arr[i])
	}
	assert c.keys().len == b.keys().len
	assert c.size == b.size
}

fn test_10() {
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

fn test_11() {
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

fn test_12() {
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

fn test_13() {
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

fn test_14() {
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
	rand.seed(time.now().unix)
	test_1()
	test_2()
	test_3()
	test_4()
	test_5()
	test_6()
	test_7()
	test_8()
	test_9()
	test_10()
	test_11()
	test_12()
	test_13()
	test_14()
}