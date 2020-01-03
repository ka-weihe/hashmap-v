import hashmap
import rand

fn test1() {
	mut m := hashmap.new_hmap()
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




fn main() {
	test1()
	test2()
	// test3()
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
