import { readFileSync } from "fs";
import { solvePartOne } from "./part1";
import { solvePartTwo } from "./part2";

(() => {
  const input: string = readFileSync("./input.txt", {
    encoding: "utf-8",
  });
  const answer = solvePartOne(input);
  console.log("Answer to part 1 = ", answer);

  const answer2 = solvePartTwo(input);
  console.log("Answer to part 2 = ", answer2);
})();
