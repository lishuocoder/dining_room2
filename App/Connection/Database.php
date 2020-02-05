<?php

namespace App\Connection;

use App\Common\Helpers;

class Database
{
    private static $p = null;
    private static $conn = null;

    private function __construct()
    {

        $dbConfig = Helpers::config('db');
        $dsn = "mysql:host={$dbConfig['host']};dbname={$dbConfig['database']}";
        // var_dump($dsn);exit;
        self::$conn = new \PDO($dsn, $dbConfig['username'], $dbConfig['password']);
    }

    static public function connect()
    {
        if (self::$p === null) {
            self::$p = new Database();
        }
        return self::$conn;
    }
}
