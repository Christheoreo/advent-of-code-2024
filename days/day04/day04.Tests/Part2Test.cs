using System.IO;
using day04;
using JetBrains.Annotations;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace day04.Tests;

[TestClass]
[TestSubject(typeof(Part2))]
public class Part2Test
{

    [TestMethod]
    public void P2()
    {
        var input = File.ReadAllText("../../../part2example.txt");
        var expected = 100;
        var answer = Part1.Solve(input);
        
        Assert.AreEqual(expected, answer);
    }
}