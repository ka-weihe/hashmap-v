import rand
import time

fn C.strcmp(byteptr, byteptr) int
fn C.memcmp(byteptr, byteptr) int

fn generate_strings(len, amount int) &string {
	mem := malloc(sizeof(string) * amount) 
	mut arr := &string(mem)
	for i := 0; i < amount - 1; i += 2 {
		mut buf := &byte(vcalloc(sizeof(byte) * (len + 1) ))
		for j in 0..len {
			buf[j] = byte(rand.next(int(`z`) - int(`a`)) + `a`)
		}
		buf[len] = 0
		str := string(buf)
		arr[i] = str
		arr[i + 1] = str
	}
	return arr
}

[inline]
fn fast_string_eq(a, b string) bool {
	if a.len != b.len {
		return false
	}
	return C.memcmp(a.str, b.str, b.len) == 0
}

[inline]
fn fast_string_eq2(a, b string) bool {
	return C.strcmp(a.str, b.str) == 0
}

fn main() {
	amount := 100000000
	a := generate_strings(30, amount)
	mut b := 0
	start_time := time.ticks()
	for i := 0; i < amount - 1; i += 2 {
		if fast_string_eq2(a[i], a[i + 1]) {
			b++
		}
	}
	end_time := time.ticks() - start_time
	println(b)
	println(end_time)
}