
import time
fn sieve(n int) []int {
    mut primes := []int{}
    mut sieve := []bool{len: n + 1, init: true}

    sieve[0] = false
    sieve[1] = false

    for i := 2; i*i <= n; i++ {
        if sieve[i] {
            for j := i * i; j <= n; j += i {
                sieve[j] = false
            }
        }
    }

    for i := 2; i <= n; i++ {
        if sieve[i] {
            primes << i
        }
    }

    return primes
}
fn main() {
	start_time := time.new_stopwatch()
    primes := sieve(100_000_000)
	println(primes.len)
	total_elapsed := start_time.elapsed()
	println(total_elapsed)
}