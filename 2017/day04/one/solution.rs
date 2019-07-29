use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    let filename = &args[1];

    let text = fs::read_to_string(filename)
        .expect("Something went wrong reading the file");

    let lines = text.trim().split("\n");
    let mut count = 0;

    for line in lines {
        let words = line.trim().split_whitespace();
        let mut safe = true;
        for (idx, i) in words.clone().enumerate() {
            for (_jdx, j) in words.clone().skip(idx + 1).enumerate() {
                if i == j {
                    safe = false;
                }
            }
        }
        if safe {
            count += 1;
        }
    }

    println!("{}", count);
}
