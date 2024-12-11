using System.Text;

namespace Day09;

public static class Part1
{
    public static int Solve(string input)
    {
       
        var answer = 0;
        var sb = new StringBuilder("");
        var id = 0;
        for (var i = 0; i < input.Length; i++)
        {
            var digit = (int)char.GetNumericValue(input[i]);
            if (i % 2 == 0)
            {
                //  the layout of the file
                for (var x = 0; x < digit; x++)
                {
                    sb.Append(id);
                }
                id++;

            }
            else
            {
                // the free space between files
                for (var x = 0; x < digit; x++)
                {
                    sb.Append('.');
                }
            }
        }
        
        // now shift

        return answer;
    }
}