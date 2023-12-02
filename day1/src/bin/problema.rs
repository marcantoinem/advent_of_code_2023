use std::time::Instant;

fn main() {
    let input = include_str!("input.txt");
    let time = Instant::now();
    let mut sum = 0;
    for line in input.lines() {
        let line = line.as_bytes();
        let first_digit = *line.iter().find(|c| c.is_ascii_digit()).unwrap() as u32 - 48;
        let last_digit = *line.iter().rev().find(|c| c.is_ascii_digit()).unwrap() as u32 - 48;
        sum += first_digit * 10 + last_digit;
    }
    println!("{} computed in {}s", sum, time.elapsed().as_secs_f32());
}
