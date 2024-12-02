package main

import (
	"fmt"
	"strconv"
	"strings"

	_ "embed"
)

//go:embed input.txt
var input string

func main() {
	partOneAnswer := solvePartOne(input)
	fmt.Printf("Answer to Part One = %d\n", partOneAnswer)

	partTwoAnswer := solvePartTwo(input)
	fmt.Printf("Answer to Part Two = %d\n", partTwoAnswer)
}

func solvePartOne(input string) int {
	answer := 0
	lines := strings.Split(input, "\n")

	for _, line := range lines {
		parts := strings.Split(line, " ")
		numbers := make([]int, 0)
		for _, part := range parts {
			num, _ := strconv.Atoi(part)
			numbers = append(numbers, num)
		}

		isIncreasing := numbers[1] > numbers[0]

		isSafe := true

		for i := 1; i < len(numbers); i++ {
			left := numbers[i-1]
			right := numbers[i]
			if isIncreasing {
				if right-left < 1 || right-left > 3 {
					isSafe = false
					break

				}
				continue
			}

			if left-right < 1 || left-right > 3 {
				isSafe = false
				break

			}
		}

		if isSafe {
			answer += 1
		}
	}

	return answer
}

func solvePartTwo(input string) int {
	return 1
}
