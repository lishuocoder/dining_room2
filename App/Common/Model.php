<?php

namespace App\Common;

use App\Connection\Database;
use Exception;

abstract class Model
{
    public $conn;
    public $tableName = null;

    public function __construct()
    {
        $this->conn = Database::connect();
    }


    public function query($sql)
    {
        $sql = str_replace('#table#', $this->tableName, $sql);
        
        $query = $this->conn->query($sql);
        if ($this->conn->errorCode() === '00000') {
            return $query;
        }
        throw new Exception($this->conn->errorInfo()[2]);
        // var_dump($this->conn->errorInfo());exit;
    }
}
