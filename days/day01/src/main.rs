const INPUT: &str = include_str!("./input.txt");
fn main() {
    let part_one_answer = solve_part_one(INPUT);
    println!("Part 1 Answer = {}", part_one_answer);

    let part_two_answer = solve_part_two(INPUT);
    println!("Part 2 Answer = {}", part_two_answer);
}

pub fn solve_part_one(input: &str) -> u32 {
    let lines = input.split("\n");
    let mut left: Vec<u32> = Vec::new();
    let mut right: Vec<u32> = Vec::new();

    lines.for_each(|line| {
        let parts: Vec<&str> = line.split_whitespace().collect();
        let part_1: u32 = parts[0].parse().unwrap();
        let part_2: u32 = parts[1].parse().unwrap();
        left.push(part_1);
        right.push(part_2);
    });

    left.sort();
    right.sort();

    let mut answer: u32 = 0;

    for i in 0..left.len() {
        let diff = left[i].abs_diff(right[i]);
        answer += diff;
    }
    return answer;
}

pub fn solve_part_two(input: &str) -> u32 {
    let lines = input.split("\n");
    let mut left: Vec<u32> = Vec::new();
    let mut right: Vec<u32> = Vec::new();

    lines.for_each(|line| {
        let parts: Vec<&str> = line.split_whitespace().collect();
        let part_1: u32 = parts[0].parse().unwrap();
        let part_2: u32 = parts[1].parse().unwrap();
        left.push(part_1);
        right.push(part_2);
    });

    left.sort();
    right.sort();

    let mut answer: u32 = 0;

    for i in 0..left.len() {
        let num = left[i];

        let count: u32 = right
            .iter()
            .filter(|x| num == **x)
            .count()
            .try_into()
            .unwrap();
        answer += num * count;
    }
    return answer;
}

#[cfg(test)]
mod tests {
    use super::*; // Import the functions to test

    const TEST_FILE_CONTENTS_1: &str = include_str!("./part1example.txt");

    #[test]
    fn test_solve_part_one() {
        assert_eq!(solve_part_one(TEST_FILE_CONTENTS_1), 11);
    }

    #[test]
    fn test_solve_part_two() {
        assert_eq!(solve_part_two(TEST_FILE_CONTENTS_1), 31);
    }
}
