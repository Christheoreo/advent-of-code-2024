<?php
namespace MyApp\Tests;


use MyApp\Part01;
use MyApp\Tests\BaseTestCase;
class PartOne extends BaseTestCase
{
    public function testPartOne()
    {
        $input = $this->readFile("part1example.txt");
        $answer = Part01::Solve($input);
        $this->assertEquals(161, $answer);
    }
}
