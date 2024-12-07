package main

import (
	_ "embed"
	"testing"
)

//go:embed part1example.txt
var partOneExample string

//go:embed part2example.txt
var partTwoExample string

// Test for SolvePartOne
func TestSolvePartOne(t *testing.T) {
	// Expected result
	expected := 3749

	// Actual result from SolvePartOne
	result := solvePartOne(partOneExample)

	if result != expected {
		t.Errorf("SolvePartOne() = %v; want %v", result, expected)
	}
}

// Test for SolvePartTwo
func TestSolvePartTwo(t *testing.T) {
	// Expected result
	expected := 4

	// Actual result from SolvePartTwo
	result := solvePartTwo(partTwoExample)

	if result != expected {
		t.Errorf("SolvePartTwo() = %v; want %v", result, expected)
	}
}

// Benchmark for SolvePartOne
func BenchmarkSolvePartOne(b *testing.B) {
	for i := 0; i < b.N; i++ {
		solvePartOne(input)
	}
}

// Benchmark for SolvePartTwo
func BenchmarkSolvePartTwo(b *testing.B) {
	for i := 0; i < b.N; i++ {
		solvePartTwo(input)
	}
}
