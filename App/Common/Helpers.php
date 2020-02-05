<?php

namespace App\Common;

class Helpers
{
    public static function get(string $key)
    {
        return isset($_GET[$key]) ? $_GET[$key] : null;
    }

    public static function config($key)
    {
        $configs = require_once './config.php';
        return $configs[$key];
    }

    /**
     * 返回支持跨域的接送字符串
     *
     * @param array $data
     * @return void
     */
    public static function responseJson(array $data){
        header('Content-Type: application/json; charset=UTF-8');
        header('Access-Control-Allow-Origin:*');
        echo json_encode($data);exit;
    }
}
