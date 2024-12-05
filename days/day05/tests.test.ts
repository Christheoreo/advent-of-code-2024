import { expect, test } from "vitest";
import { solvePartOne } from "./part1";
import { solvePartTwo } from "./part2";
import { readFileSync } from "fs";

const part1example: string = readFileSync("./part1example.txt", {
  encoding: "utf-8",
});

const part2example: string = readFileSync("./part2example.txt", {
  encoding: "utf-8",
});

test("solve part one", () => {
  const expected = 143;
  const actual = solvePartOne(part1example);

  expect(actual).toEqual(expected); 
});

test("solve part two", () => {
  const expected = 123;
  const actual = solvePartTwo(part2example);

  expect(actual).toEqual(expected);
});
