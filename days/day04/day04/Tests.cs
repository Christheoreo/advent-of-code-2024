namespace day04;
using Xunit;

public class Tests
{
    [Fact]
    public void Part1_ReturnsCorrectAnswer()
    {
        // Arrange
        var input = System.IO.File.ReadAllText("../../../../day04/part1example.txt");
        const int expectedAnswer = 100;
        // Act
        var result = Part1.Solve(input);

        // Assert
        Assert.Equal(expectedAnswer, result);
    }
    
    [Fact]
    public void Part2_ReturnsCorrectAnswer()
    {
        // Arrange
        var input = System.IO.File.ReadAllText("../../../../day04/part2example.txt");
        const int expectedAnswer = 100;
        // Act
        var result = Part2.Solve(input);

        // Assert
        Assert.Equal(expectedAnswer, result);
    }
}