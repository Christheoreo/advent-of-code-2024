<?php

use MyApp\Tests\BaseTestCase;

use MyApp\Part01;
class ExampleTest extends BaseTestCase
{
    public function testPartOne()
    {
        $input = $this->readFile("part1example.txt");
        $answer = Part01::Solve($input);
        $this->assertEquals(4, $answer);
    }
}
