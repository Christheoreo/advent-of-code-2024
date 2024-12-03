// See https://aka.ms/new-console-template for more information

using day04;

Console.WriteLine("Hello, World!");
// var projectDirectory = AppContext.BaseDirectory;
// var inputFilePath = Path.Combine(projectDirectory, "input.txt");
var input = System.IO.File.ReadAllText("../../../../day04/input.txt");

var partOneAnswer = Part1.Solve(input);

Console.WriteLine($"Part 1: {partOneAnswer}");

var partTwoAnswer = Part2.Solve(input);

Console.WriteLine($"Part 2: {partTwoAnswer}");