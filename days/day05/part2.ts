export const solvePartTwo = (input: string): number => {
  let lines = input.split("\n");
  const rules: number[][] = [];
  const pageNumbersOfEachUpdate: number[][] = [];

  for (const line of lines) {
    if (line.includes("|")) {
      let parts = line.split("|");
      rules.push([Number(parts[0]), Number(parts[1])]);
      continue;
    }
    if (line.trim() == "") continue;

    pageNumbersOfEachUpdate.push([...line.split(",").map((v) => Number(v))]);
  }

  let answer: number = 0;

  for (const update of pageNumbersOfEachUpdate) {
    let isGood = true;

    let u = [...update];

    for (let i = 0; i < u.length - 1; i++) {
      let num = u[i];
      let next = u[i + 1];

      // is there explicity a rule that says the order is good
      let positiveRules = rules.filter(
        (rule) => rule[0] === num && rule[1] === next
      );
      if (positiveRules.length > 0) {
        continue;
      }
      let negativeRules = rules.filter(
        (rule) => rule[1] === num && rule[0] === next
      );
      if (negativeRules.length > 0) {
        isGood = false;
        // choose the first and swap them around
        swap(u, i, i + 1);
        i = -1;
        continue;
      }
    }
    if (!isGood) {
      answer += u[(u.length - 1) / 2];
    }
  }

  return answer;
};

const swap = (array: number[], index1: number, index2: number): void => {
  [array[index1], array[index2]] = [array[index2], array[index1]];
};
