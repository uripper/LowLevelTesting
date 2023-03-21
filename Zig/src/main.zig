const std = @import("std");
const libc = @import("libc");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("Hello {s}.\n", .{"codebase"});
    // Zig is a statically typed language, so we need to specify the type of the
    // variable we want to print. The type is inferred from the value.
    const a: u8 = 42;
    std.debug.print("The answer is {d}.\n", .{a});
    // We can also print a pointer.
    const b: *const u8 = &a;
    std.debug.print("The address of the answer is {p}.\n", .{b});

    // Zig has a special syntax for printing a value in its default format.
    // This is equivalent to `std.debug.print("{any}\n", .{a});`
    const c: bool = true;
    std.debug.print("The answer is {any}.\n", .{c});

    // Here is the obligatory prime sieve example.

    const n: usize = 100_000_000;
    const index: u64 = 1_000;
    var sieve: [n]bool = [_]bool{true} ** n;

    for (&sieve, 2..) |*is_prime, i| {
        if (!is_prime.*) continue;
        var j: usize = i * i;
        while (j < n) : (j += i) {
            sieve[j] = false;
        }
    }
    var prime_count: u64 = 0;
    for (sieve[2..], 2..) |is_prime, i| {
        if (is_prime) {
            prime_count += 1;
            if (prime_count == index) { // Replace 'index' with the desired index
                std.debug.print("The prime at index {d} is {d}.\n", .{index, i});
                break;
            }
    }
}
}