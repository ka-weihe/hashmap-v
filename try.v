fn main() {
	// x := map[string]int
	// x["a"] = map[string]int
	// x["a"]["b"] = 5
	// // x["a"]["c"] = 5
	// c := x["a"]["b"]
	// eprintln('c: $c.str()')
	mut a, mut b := 1, 2
	a, b = b, a
	println(a)
	println(b)
}