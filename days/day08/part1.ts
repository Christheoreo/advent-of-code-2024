type M = Record<string, { x: number; y: number }[]>;

export const solvePartOne = (input: string): number => {
  let answer: number = 1;
  // const uniuqeSignals = new Set(
  //   ...input.split("").filter((v) => v !== "." && v != "")
  // );
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
        // console.log("val", val, "nextVal", nextVal);
        // const xDiff = val.x < nextVal.x ? nextVal.x - val.x  : val.x - nextVal.x;
        // const yDiff = val.y < nextVal.y ? nextVal.y - val.y : val.y - nextVal.y;
        const xDiff =  val.x - nextVal.x;
        const yDiff = val.y - nextVal.y;



        // can it fit before and after?
        let xPos = val.x + xDiff;
        let yPos = val.y + yDiff;
        let canFitX = xPos >= 0 && xPos < lines[0].length;
        let canFitY = yPos >= 0 && yPos < lines.length;
        if (canFitX && canFitY) {
          xx.set(`${xPos},${yPos}`, 1);
          console.log(
            `AA Key '${key}' has a point of x = ${xPos} and y = ${yPos}`,
            val,
            nextVal
          );
        }

        // now try and do the other side?

        xPos = nextVal.x - xDiff;
        yPos = nextVal.y - yDiff;

        canFitX = xPos >= 0 && xPos < lines[0].length;
        canFitY = yPos >= 0 && yPos < lines.length;
        if (canFitX && canFitY) {
          xx.set(`${xPos},${yPos}`, 1);
          console.log(
            `BB Key '${key}' has a point of x = ${xPos} and y = ${yPos}`,
            val,
            nextVal
          );
        }
      }
    });
  });

  // console.log("mapper", mapper);

  // let lines = input.split("\n");

  return xx.size;
};
