<?php

use MyApp\Tests\BaseTestCase;

use MyApp\Part02;
class ExampleTest extends BaseTestCase
{
    public function testPartOne()
    {
        $input = $this->readFile("part2example.txt");
        $answer = Part02::Solve($input);
        $this->assertEquals(4, $answer);
    }
}
