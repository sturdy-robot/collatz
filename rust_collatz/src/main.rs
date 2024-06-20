fn collatz(seed: i64) -> i64 {
    let mut x = seed;
    let mut steps = 0;
    while x > 1 {
        if x % 2 == 0 {
            x /= 2;
        } else {
            x = (3 * x) + 1;
        }
        steps += 1;
    }

    steps
}


fn main() {
    let start = std::time::Instant::now();

    for seed in 1..=1_000_000_000 {
        let steps = collatz(seed);
        if seed % 1_000_000 == 0 {
            println!("Seed: {} Steps: {}", seed, steps);
        }
    }
    let stop = std::time::Instant::now();
    let total_time = stop - start;
    println!("Took {}", total_time.as_secs_f64())
}
