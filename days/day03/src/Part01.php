<?php

namespace MyApp;

class Part01
{
    public static function Solve(string $input): int
    {
        $pattern = '/mul\(\d{1,3},\d{1,3}\)/';
        $matches = [];
        preg_match_all($pattern, $input, $matches);
        $answer = 0;
        foreach ($matches[0] as $match) {
            $firstSlice = substr($match, 4);
            $secondSlice = substr($firstSlice, 0, strlen($firstSlice) - 1);
            $parts = explode(",", $secondSlice);
            $answer += $parts[0] * $parts[1];
        }
        return $answer;
    }
}