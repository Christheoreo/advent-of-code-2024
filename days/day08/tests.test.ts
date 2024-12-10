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
  const expected = 14;
  const actual = solvePartOne(part1example);

  expect(actual).toEqual(expected); 
});

test("solve part two A", () => {
  const expected = 9;
  const actual = solvePartTwo(part2example);

  expect(actual).toEqual(expected);
});

test("solve part two B", () => {
  const expected = 34;
  const actual = solvePartTwo(part1example);

  expect(actual).toEqual(expected);
});
