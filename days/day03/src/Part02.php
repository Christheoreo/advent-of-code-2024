<?php

namespace MyApp;

class Part02
{
    public static function Solve(string $input): int
    {
        // match mul(x,x) OR do() OR don't()
        $pattern = '/(mul\(\d{1,3},\d{1,3}\))|(do\(\))|(don\'t\(\))/';
        $matches = [];
        preg_match_all($pattern, $input, $matches);
        $answer = 0;
        $do = true;
        foreach ($matches[0] as $match) {
            switch ($match) {
                case 'do()':
                    $do = true;
                    break;
                case 'don\'t()':
                    $do = false;
                    break;
                default:
                    if (!$do) {
                        break;
                    }
                    // Remove everything before the first digit
                    $firstSlice = substr($match, 4);
                    // Remove everything after the last digit
                    $secondSlice = substr($firstSlice, 0, strlen($firstSlice) - 1);
                    // Create an array of  the 2 numbers
                    $parts = explode(",", $secondSlice);
                    // Multiply them
                    $answer += $parts[0] * $parts[1];
                    break;
            }

        }
        return $answer;
    }
}