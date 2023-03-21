module main

	// Vlang interops with C and has quite a few safety features, like Rust. Making it a good choice for writing low level code.
	// The safety features are as followed:
	// Bounds checking
	// No undefined values
	// No variable shadowing
	// Immutable by default
	// Immutable structs by default
	// Option/Result and mandatory error checks
	// Sum types
	// Generics
	// Immutable function args by default. mutable args have to be marked on call
	// No null outside of unsafe
	// No undefined behavior (WIP, overflows can still result in UB)
	// No global variables

	// Blazing fast compilation times (<1s!!)

	// Flexible memory management

	// C translation, with C++ to V translation in the works

	// Hot reloading without restarting or recompiling

	// Graphics library

	// GUI library

	// Constants have to be defined at the top of the file

const (
		pi = 3.14
		e = 2.71
)
fn main() {
    areas := ['game', 'web', 'tools', 'science', 'systems',
              'embedded', 'drivers', 'GUI', 'mobile']
    for area in areas {
        println('Hello, ${area} developers!')

    }

	a := "hello"
	b := "world"
	// V has a built in string comparison function
	// Returns 0 if the strings are equal
	// Returns -1 if the first string is less than the second
	// Returns 1 if the first string is greater than the second
	println(compare_strings(b, a))
	println(compare_strings(a, b))
	println(compare_strings(a, a))

	// V has a built in string concatenation function
	println(a + b)

	// V has a built in string length function
	println(a.len)

	// V has a built in string to int function
	println(a.int()) // returns 0, because "hello" is not a number

	// V has a built in string to float function
	println(a.f64()) // returns 0.0, because "hello" is not a number

	// V has a built in string to bool function
	println(a.bool()) // returns false, because "hello" is not a boolean

	// V has a built in int to string function
	println(123.str())

	// V has a built in float to string function
	println(123.456.str())

	// V has a built in bool to string function
	println(true.str())

	// V has a built in string to byte array function
	println(a.bytes())
}
