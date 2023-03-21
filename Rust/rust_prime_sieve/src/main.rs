use std::time::Instant;

fn sieve(n: usize) -> Vec<usize> {
    let mut primes = Vec::new();
    let mut sieve = vec![true; n + 1];
    sieve[0] = false;
    sieve[1] = false;

    for i in 2..=n {
        if sieve[i] {
            primes.push(i);
            for j in (i * i..=n).step_by(i) {
                sieve[j] = false;
            }
        }
    }

    primes
}

fn main() {
    let total_time = Instant::now();
    let primes = sieve(100_000_000);
    let end_time = Instant::now();
    let elapsed = end_time - total_time;
    println!("Found {} primes", primes.len());
    println!("Total runtime: {:?}", elapsed);
}
