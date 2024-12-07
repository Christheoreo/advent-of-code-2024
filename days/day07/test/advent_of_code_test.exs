defmodule AdventOfCodeTest do
  use ExUnit.Case
  alias AdventOfCode

  @example_input System.get_env("EXAMPLE_INPUT")

  test "solve_part1 with example input" do
    assert AdventOfCode.solve_part1(@example_input) == 3749
  end

  test "solve_part2 with example input" do
    assert AdventOfCode.solve_part2(@example_input) == 3
  end
end
