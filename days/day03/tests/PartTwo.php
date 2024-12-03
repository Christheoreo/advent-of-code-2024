<?php
namespace MyApp\Tests;

use MyApp\Part02;

use MyApp\Tests\BaseTestCase;
class PartTwo extends BaseTestCase
{
    public function testPartOne()
    {
        $input = $this->readFile("part2example.txt");
        $answer = Part02::Solve($input);
        $this->assertEquals(48, $answer);
    }
}
