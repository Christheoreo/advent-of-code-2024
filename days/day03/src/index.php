<?php
namespace MyApp;
require_once __DIR__ . '/../vendor/autoload.php';

$input = file_get_contents("./input.txt");
$partOneAnswer = Part01::Solve($input);


echo "Answer to part 1 = '$partOneAnswer'\n";

$partOneAnswer = Part02::Solve($input);


echo "Answer to part 2 = '$partOneAnswer'\n";