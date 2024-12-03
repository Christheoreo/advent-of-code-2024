<?php

namespace MyApp\Tests;

use PHPUnit\Framework\TestCase;

class BaseTestCase extends TestCase
{
    public function readFile(string $filePath): string
    {
        if (!file_exists($filePath)) {
            throw new \Exception("File not found: $filePath");
        }
    
        $contents = file_get_contents($filePath);
    
        if ($contents === false) {
            throw new \Exception("Failed to read file: $filePath");
        }
    
        return $contents;
    }
}