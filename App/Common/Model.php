<?php

namespace App\Common;

use App\Connection\Database;
use Exception;

/**
 * Class Model
 * @package App\Common
 */
abstract class Model
{
    public $conn;
    public $tableName = null;

    /**
     * Model constructor.
     * @throws Exception
     */
    public function __construct()
    {
        if (!$this->tableName) {
            throw new Exception('请设置表名');
        }
        $this->conn = Database::connect();
    }

    private function getSql($sql) {
        return str_replace('#table#', $this->tableName, $sql);
    }


    public function query($sql, $bind = [])
    {
        $sql = $this->getSql($sql);
        
        $query = $this->conn->prepare($sql);
        $query->execute($bind);
        if ($query->errorCode() === '00000') {
            return $query;
        }
        throw new Exception($this->conn->errorInfo()[2]);
    }

    /**
     * 执行一个普通的sql
     * @param $sql
     * @param array $bind
     * @return bool
     * @throws Exception
     */
    public function exec($sql, $bind = []) {
        $sql = $this->getSql($sql);

        $query = $this->conn->prepare($sql);
        $execute = $query->execute($bind);
        if ($query->errorCode() === '00000') {
            return $execute;
        }
        throw new Exception($this->conn->errorInfo()[2]);
    }

    /**
     * @param $data
     * @return string
     * @throws Exception
     */
    public function insert($data) {
        $dataKeys = array_keys($data);
        $fields = '`' . implode('`,`', $dataKeys) . '`';
        $values = ':' . implode(',:', $dataKeys);
        $sql = $this->getSql("insert into #table# ($fields) values ($values)");

        $prepare = $this->conn->prepare($sql);
        $prepare->execute($data);
        if ($prepare->errorCode() === '00000') {
            return $this->conn->lastInsertId();
        }
        throw new Exception($prepare->errorInfo()[2]);
    }
}
