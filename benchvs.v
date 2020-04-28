import hashmap
import rand
import time

fn generate_strings(len, amount int) &string {
	mem := malloc(sizeof(string) * amount) 
	mut arr := &string(mem)
	for i in 0..amount {
		mut buf := &byte(vcalloc(sizeof(byte) * (len + 1) ))
		for j in 0..len {
			buf[j] = byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		buf[len] = 0
		str := string(buf)
		arr[i] = str
	}
	return arr
}

fn main() {
	arr := generate_strings(100, 3000)
	mut m := hashmap.new_hmap()
	for i := 0; i < 3000; i++ {
		m.set(arr[i], i)
	}
	mut a := 1
	start_time := time.ticks()
	for _ in 0..10000 {
		for i in 0..3000 {
			a += m.get(arr[i])
		}
	}
	end_time := time.ticks() - start_time
	println(end_time)
	println(a)
}