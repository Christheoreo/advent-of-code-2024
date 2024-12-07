defmodule AdventOfCode do
  def solve_part1(input) do
    # Implement solution for part 1
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&AdventOfCode.mapper/1)
    |> Enum.sum()
  end

  def solve_part2(input) do
    # Implement solution for part 2
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.max()
  end

  def mapper(line) do
    IO.inspect(line, label: "Debugging line")
    [head | tail] = line |> String.split(": ", parts: 2, trim: true)
    test_value = String.to_integer(head)
    numbers = tail |> String.split(" ", trim: true) |> Enum.map(&String.to_integer/1)
    get_value(test_value, numbers)
  end

  def get_value(test_value, numbers) do
    [head | tail] = numbers
    value = recur(head, tail, test_value)

    case value do
      x when x == test_value ->
        test_value

      _ ->
        0
    end
  end

  def recur(num, remainingNumbers, test_value) do
    case length(remainingNumbers) do
      0 ->
        num

      1 ->
        val = num * remainingNumbers[0]

        case val do
          x when x != test_value ->
            num + remainingNumbers[0]
          _ ->
            val
        end

      _ ->
        [head | tail] = remainingNumbers

        val = recur(num * head, tail, test_value)

        case val do
          x when x != test_value ->
            recur(num + head, tail, test_value)

          _ ->
            val
        end
    end
  end
end
