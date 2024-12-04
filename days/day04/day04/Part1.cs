namespace day04;

public static class Part1
{
    public static int Solve(string input)
    {
        var lines = input.Split(Environment.NewLine, StringSplitOptions.RemoveEmptyEntries);
        int timesFound = 0;
        for (int i = 0; i < lines.Length; i++)
        {
            for (int rowIndex = 0; rowIndex < lines[i].Length; rowIndex++)
            {
                // look right (if possible)
                if (rowIndex + 3 < lines[i].Length)
                {
                    var part = lines[i].Substring(rowIndex, 4);

                    if (part is "XMAS" or "SAMX")
                    {
                        timesFound++;
                    }
                }

                // // Can we look up?
                // if (i > 3)
                // {
                //     var part =
                //         $"{lines[i - 3][rowIndex]}{lines[i - 2][rowIndex]}{lines[i - 1][rowIndex]}{lines[i][rowIndex]}";
                //     if (part is "XMAS" or "SAMX")
                //     {
                //         timesFound++;
                //     }
                //     // Can we look diagonal top left?
                //     // Can we look diagonal top right?
                // }
                
                // Can we look down?
                if (i + 3 < lines.Length)
                {
                    var verticalDownPart =
                        $"{lines[i][rowIndex]}{lines[i +1][rowIndex]}{lines[i +2][rowIndex]}{lines[i + 3][rowIndex]}";
                    if (verticalDownPart is "XMAS" or "SAMX")
                    {
                        timesFound++;
                    }
                    
                    
                    // Can we look diagonal bottom left?

                    if (rowIndex - 3 >= 0)
                    {
                        var part = $"{lines[i][rowIndex]}{lines[i+1][rowIndex-1]}{lines[i+2][rowIndex-2]}{lines[i+3][rowIndex-3]}";
                        if (part is "XMAS" or "SAMX")
                        {
                            timesFound++;
                        }
                    }
                    // Can we look diagonal top right?
                    if (rowIndex + 3 < lines[i].Length)
                    {
                        var part = $"{lines[i][rowIndex]}{lines[i+1][rowIndex+1]}{lines[i+2][rowIndex+2]}{lines[i+3][rowIndex+3]}";
                        if (part is "XMAS" or "SAMX")
                        {
                            timesFound++;
                        }
                    }
                }
                
            }
        }

        return timesFound;
    }
}