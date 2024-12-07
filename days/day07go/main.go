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
		parts := strings.Split(line, ": ")

		testNumber, _ := strconv.Atoi(parts[0])

		numbers := make([]int, 0)

		for _, numS := range strings.Split(parts[1], " ") {
			n, _ := strconv.Atoi(numS)
			numbers = append(numbers, n)
		}

		value := recur(numbers[0], numbers[1:], testNumber)

		if value == testNumber {
			answer += testNumber
		}

	}

	return answer
}

func recur(num int, remainingNumbers []int, testValue int) int {
	if len(remainingNumbers) == 1 {
		v := remainingNumbers[0]
		if num+v == testValue || num*v == testValue {
			// we found an answer!
			return testValue
		}
		return num
	}

	v := remainingNumbers[0]
	val := recur(num*v, remainingNumbers[1:], testValue)
	if val != testValue {
		val = recur(num+v, remainingNumbers[1:], testValue)
	}

	return val

}

func solvePartTwo(input string) int {
	answer := 0
	lines := strings.Split(input, "\n")

	for _, line := range lines {
		parts := strings.Split(line, ": ")

		testNumber, _ := strconv.Atoi(parts[0])

		numbers := strings.Split(parts[1], " ")
		num, _ := strconv.Atoi(numbers[0])

		value := recur2(num, numbers[1:], testNumber)

		if value == testNumber {
			answer += testNumber
		}

	}

	return answer
}

func recur2(num int, remainingNumbers []string, testValue int) int {
	if len(remainingNumbers) == 1 {

		v, _ := strconv.Atoi(remainingNumbers[0])
		mergedV, _ := strconv.Atoi(fmt.Sprintf("%d%s", num, remainingNumbers[0]))
		if num+v == testValue || num*v == testValue || mergedV == testValue {
			// we found an answer!
			return testValue
		}
		return 0
	}

	v, _ := strconv.Atoi(remainingNumbers[0])
	mergedV, _ := strconv.Atoi(fmt.Sprintf("%d%s", num, remainingNumbers[0]))

	val := recur2(num*v, remainingNumbers[1:], testValue)
	if val != testValue {
		val = recur2(num+v, remainingNumbers[1:], testValue)
		if val != testValue {
			val = recur2(mergedV, remainingNumbers[1:], testValue)
		}
	}

	return val

}
