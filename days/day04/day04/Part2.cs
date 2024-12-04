namespace day04;

public static class Part2
{
    public static int Solve(string input)
    {
        var lines = input.Split(Environment.NewLine, StringSplitOptions.RemoveEmptyEntries);
        var timesFound = 0;
        for (var i = 0; i < lines.Length; i++)
        {
            for (var rowIndex = 0; rowIndex < lines[i].Length; rowIndex++)
            {
                // Can we check if this position?
                if (rowIndex + 2 >= lines[i].Length || i + 2 >= lines.Length) continue;
                var parts =
                    $"{lines[i][rowIndex]}{lines[i][rowIndex + 2]}{lines[i + 1][rowIndex + 1]}{lines[i + 2][rowIndex]}{lines[i + 2][rowIndex + 2]}";

                if (parts is "MMASS" or "MSAMS" or "SMASM" or "SSAMM")
                {
                    timesFound++;
                }
            }
        }

        return timesFound;
    }
}