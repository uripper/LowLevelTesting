package main

import "core:fmt"

main :: proc() {
	my_integer: int
    my_integer = 1
    fmt.println("Hello, world!", my_integer)
    my_integer += 1
    fmt.println("Hello, world!", my_integer)
    // This is a constant
    my_constant :: "what"
    fmt.println(my_constant)
    y : int : 123
    z :: y + 7
    fmt.println(z)

    // A basic for loop
    for i := 0; i < 10; i += 1 {
        fmt.println(i)
    }
    // Can also be written as
    for i in 0..<10 {
        fmt.println(i)
    }
    some_string :: "Hello, world!"
    for value in some_string {
        fmt.println(value)
    }
    for char, index in some_string {
        fmt.println("index: ", index, " char: ", char)
    }

    fibonacci :: proc(n: int) -> int {
	switch {
	case n < 1:
		return 0
	case n == 1:
		return 1
	}
	return fibonacci(n-1) + fibonacci(n-2)
}

fmt.println(fibonacci(500))

}