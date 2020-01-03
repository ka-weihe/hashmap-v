import hashmap
import rand
import time

fn hashmap_set_bench(arr []string, repeat int) {
	start_time := time.ticks()
	for _ in 0..repeat {
		mut b := hashmap.new_hmap()
		for x in arr {
			b.set(x, 1)
		}
	}
	end_time := time.ticks() - start_time
	string_len := arr[0].len
	println("hashmap_set_bench_$string_len: $end_time")
}

fn map_set_bench(arr []string, repeat int) {
	start_time := time.ticks()
	for _ in 0..repeat {
		mut b := map[string]int
		for x in arr {
			b[x] = 1
		}
	}
	end_time := time.ticks() - start_time
	string_len := arr[0].len
	println("map_set_bench_$string_len:   $end_time")
}

fn hashmap_get_bench(arr []string, repeat int) {
	mut b := hashmap.new_hmap()
	for x in arr {
		b.set(x, 1)
	}
	start_time := time.ticks()
	for _ in 0..repeat {
		for x in arr {
			b.get(x)
		}
	}
	end_time := time.ticks() - start_time
	string_len := arr[0].len
	println("hashmap_get_bench_$string_len: $end_time")
}

fn map_get_bench(arr []string, repeat int) {
	mut b := map[string]int
	for x in arr {
		b[x] = 1
	}
	start_time := time.ticks()
	for _ in 0..repeat {
		for x in arr {
			b[x]
		}
	}
	end_time := time.ticks() - start_time
	string_len := arr[0].len
	println("map_get_bench_$string_len:   $end_time")
}

fn benchmark_strings() {
	for i := 1; i < 1025; i = i * 2 {
		mut arr := []string
		for _ in 0..10000 {
			mut buf := []byte
			for j in 0..i {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)
			arr << s
		}
		map_set_bench(arr, 100)
		hashmap_set_bench(arr, 100)
		map_get_bench(arr, 100)
		hashmap_get_bench(arr, 100)
	}
}


fn benchmark_size() {
	for i := 1; i < 10000; i = i * 10 {
		mut arr := []string
		for _ in 0..(10 * i) {
			mut buf := []byte
			for j in 0..30 {
				buf << byte(rand.next(int(`z`) - int(`a`)) + `a`)
			}
			s := string(buf)
			arr << s
		}
		map_set_bench(arr, 10000)
		hashmap_set_bench(arr, 10000)
		map_get_bench(arr, 10000)
		hashmap_get_bench(arr, 10000)
	}
}

fn benchmark_nums() {
	mut arr := []string
	for i in 0..10000 {
		arr << i.str()
	}
	map_get_bench(arr, 10)
	// hashmap_get_bench(arr, 10)
	map_set_bench(arr, 10)
	hashmap_set_bench(arr, 10)
}



fn main() {
	// benchmark_strings()
	// benchmark_nums()
	benchmark_size()
}