using Day09;
using JetBrains.Annotations;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Day09.Tests;

using System.IO;

[TestClass]
[TestSubject(typeof(Part1))]
public class Part1Test
{
    [TestMethod]
    public void PartOne()
    {
        var input = File.ReadAllText("../../../part1example.txt");
        const int expected = 1928;
        var answer = Part1.Solve(input);

        Assert.AreEqual(expected, answer);
    }
}