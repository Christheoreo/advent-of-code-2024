MIX = mix

.PHONY: test run

run:
	@$(MIX) run -e "input = File.read!(\"input.txt\"); IO.puts(\"Part 1: #{AdventOfCode.solve_part1(input)}\"); IO.puts(\"Part 2: #{AdventOfCode.solve_part2(input)}\")"
test:
	EXAMPLE_INPUT=`cat part1example.txt` $(MIX) test

