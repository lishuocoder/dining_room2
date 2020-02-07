<?php

namespace App\Common;

class Helpers
{
    public static function get(string $key)
    {
        return isset($_GET[$key]) ? $_GET[$key] : null; //isset判断变量是否声明
    }

    public static function config($key)
    {
        $configs = require_once './config.php';  //require_once 加载文件一次
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
    /**
     * 返回正确的json格式数据
     *
     * @param integer $error
     * @param array $data
     * @param string $msg
     * @return void
     */
    public static function responseFormat(int $error,array $data,string $msg){
        return[
            'error' => $error,
            'data' => $data,
            'msg' =>$msg,
        ];
    }
}
