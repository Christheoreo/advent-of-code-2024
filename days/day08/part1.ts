type M = Record<string, { x: number; y: number }[]>;

export const solvePartOne = (input: string): number => {
  const uniuqeSignals = new Set(
    input.split("").filter((v) => v !== "." && v !== "\n")
  );

  const mapper: M = {};
  const lines = input.split("\n");

  uniuqeSignals.forEach((char) => {
    mapper[char] = [];
    lines.forEach((line, lineIndex) => {
      let foundIndex = line.indexOf(char);
      while (foundIndex !== -1) {
        mapper[char].push({ y: lineIndex, x: foundIndex });
        console.log(foundIndex);

        foundIndex = line.indexOf(char, foundIndex + 1);
      }
    });
  });

  const xx = new Map<string, number>();

  Object.keys(mapper).forEach((key: keyof M) => {
    const values = mapper[key];

    values.forEach((val, index) => {
      if (index === values.length - 1) return;

      for (let i = 0; i < values.length; i++) {
        if (i === index) continue;
        // work out the distance
        const nextVal = values[i];
        const xDiff = val.x - nextVal.x;
        const yDiff = val.y - nextVal.y;

        // can it fit before and after?
        let xPos = val.x + xDiff;
        let yPos = val.y + yDiff;
        let canFitX = xPos >= 0 && xPos < lines[0].length;
        let canFitY = yPos >= 0 && yPos < lines.length;
        if (canFitX && canFitY) {
          xx.set(`${xPos},${yPos}`, 1);
        }

        // now try and do the other side?

        xPos = nextVal.x - xDiff;
        yPos = nextVal.y - yDiff;

        canFitX = xPos >= 0 && xPos < lines[0].length;
        canFitY = yPos >= 0 && yPos < lines.length;
        if (canFitX && canFitY) {
          xx.set(`${xPos},${yPos}`, 1);
        }
      }
    });
  });

  return xx.size;
};
