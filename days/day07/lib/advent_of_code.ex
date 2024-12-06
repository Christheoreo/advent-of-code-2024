defmodule AdventOfCode do
  def solve_part1(input) do
    # Implement solution for part 1
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def solve_part2(input) do
    # Implement solution for part 2
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.max()
  end
end
