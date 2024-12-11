using Day09;
using JetBrains.Annotations;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Day09.Tests;

using System.IO;

[TestClass]
[TestSubject(typeof(Part2))]
public class Part2Test
{
    [TestMethod]
    public void PartTwo()
    {
        var input = File.ReadAllText("../../../part2example.txt");
        const int expected = 9;
        var answer = Part2.Solve(input);

        Assert.AreEqual(expected, answer);
    }
}