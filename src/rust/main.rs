use std::time::SystemTime;

fn main() {
    println!("Hello ");
    let mut time_sum = 0.0;

    let runs = 1000;
    let len = 1_000_000;
    let time = SystemTime::now();
    for i in 0..runs {
        let primes = eratosthenes_sieve(len);
    }
    time_sum += time.elapsed().unwrap().as_micros() as f64 / 1000.0;
    time_sum /= runs as f64;
    println!("time in ms: {}", time_sum);
}

pub fn eratosthenes_sieve(num: usize) -> Vec<usize>{
    let mut primes: Vec<usize> = vec![2,3];
    let mut possible_primes: Vec<bool> = vec![true;num as usize];

    let mut i: usize = 5;
    let mut adder: i128 = 0;

    while i < num {
        if possible_primes[i] {
            primes.push(i);

            let mut multiple = i * 3;
            while multiple < num {
                possible_primes[multiple] = false;
                multiple += i * 2;
            }
        }  
        i += (2 + adder) as usize;
        adder = (adder - 2)*-1;
    }

    primes
}