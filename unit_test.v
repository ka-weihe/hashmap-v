import hashmap

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
	keys.free()
	m.free()
}

// fn test_11() {
// 	mut m := hashmap.new_hmap()
// 	m.set('hi', 12)
// 	m.delete('hi')
// 	m.set('hi', 1233)
// 	m.delete('his')
// 	assert m.size == 1
// 	assert m.exists('hi')
// 	assert m.exists('his') == false
// 	assert m.get('hi') == 1233
// 	assert m.keys().len == 1
// 	assert m.keys()[0] == 'hi'
// 	assert m.get('hello') == 0
// 	assert m.exists('hello') == false
// 	m.set('hi', 1)
// 	assert m.get('hi') == 1
// 	m.set('hi', 2)
// 	assert m.get('hi') == 2
// }

// fn test_12() {
// 	mut nums := hashmap.new_hmap()
// 	N := 30 * 1000
// 	for i := 0; i < N; i++ {
// 	key := i.str()
// 		nums.set(key, i)
// 	}
// 	assert nums.get('1') == 1
// 	assert nums.get('999') == 999
// 	assert nums.get('1500') == 1500
// 	assert nums.get('10000') == 10000
// 	assert nums.get('1000000') == 0
// }

// fn test_13() {
// 	mut m := hashmap.new_hmap()
// 	m.set('one', 1)
// 	m.set('two', 2)
// 	m.delete('two')
// 	assert m.exists('two') == false
// 	assert m.exists('one')
// 	assert m.exists('three') == false
// 	assert m.size == 1
// 	m.delete('aloha')
// 	assert m.size == 1
// 	m.delete('one')
// 	assert m.size == 0
// }	

// fn test_14() {
// 	mut m := hashmap.new_hmap()
// 	m.set('one', 1)
// 	m.set('two', 2)
// 	m.set('three', 2)
// 	m.set('four', 2)
// 	m.set('five', 2)
// 	assert m.exists('aloha') == false
// 	assert m.exists('two')
// 	assert m.exists('what') == false
// 	assert m.exists('three')
// 	assert m.exists('hi') == false
// 	assert m.exists('four')
// 	assert m.exists('hello') == false
// 	assert m.exists('five')
// 	assert m.exists('welcome') == false
// 	assert m.exists('one')
// 	m.delete('one')
// 	assert m.exists('one') == false
// 	m.delete('two')
// 	assert m.exists('two') == false
// 	m.delete('three')
// 	assert m.exists('three') == false
// 	m.delete('four')
// 	assert m.exists('four') == false
// 	m.delete('five')
// 	assert m.exists('five') == false
// 	assert m.size == 0
// }

// fn test_15() {
// 		for j in 0..100 {
// 			mut m := hashmap.new_hmap()
//         for _ in 0..j {
// 					for i in 0..j {
// 							m.set(i.str(), i)
// 					}
// 					assert(m.size == j)
// 					for i in 0..j {
// 							m.delete(i.str())
// 					}
// 			}
//     }
// }

