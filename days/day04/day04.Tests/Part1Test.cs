using System.IO;
using day04;
using JetBrains.Annotations;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace day04.Tests;

[TestClass]
[TestSubject(typeof(Part1))]
public class Part1Test
{

    [TestMethod]
    public void P()
    {
        var input = File.ReadAllText("../../../part1example.txt");
        var expected = 100;
        var answer = Part1.Solve(input);
        
        Assert.AreEqual(expected, answer);
    }
}