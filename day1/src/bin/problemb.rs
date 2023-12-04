use regex::Regex;
use std::time::Instant;

fn transform_digit(text: &str) -> u8 {
    if text.as_bytes()[0].is_ascii_digit() {
        return text.as_bytes()[0] - 48;
    }
    match text {
        "one" | "eno" => 1,
        "two" | "owt" => 2,
        "three" | "eerht" => 3,
        "four" | "ruof" => 4,
        "five" | "evif" => 5,
        "six" | "xis" => 6,
        "seven" | "neves" => 7,
        "eight" | "thgie" => 8,
        "nine" | "enin" => 9,
        _ => panic!("bad input"),
    }
}

fn main() {
    let input = include_str!("input.txt");
    let re1 = Regex::new(r"(one|two|three|four|five|six|seven|eight|nine|\d)").unwrap();
    let re2 = Regex::new(r"(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|\d)").unwrap();
    let time = Instant::now();
    let mut sum = 0;
    for line in input.lines() {
        let rev = &line.chars().rev().collect::<String>();
        let first_element = re1.find(line).unwrap();
        let last_element = re2.find(rev).unwrap_or(first_element);
        let first_digit = transform_digit(first_element.as_str()) as u32;
        let last_digit = transform_digit(last_element.as_str()) as u32;
        sum += first_digit * 10 + last_digit;
    }
    println!("{} computed in {}s", sum, time.elapsed().as_secs_f32());
}
