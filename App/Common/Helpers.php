<?php

namespace App\Common;

class Helpers
{
    public static function get(string $key)
    {
        return isset($_GET[$key]) ? $_GET[$key] : null; //isset判断变量是否声明
    }

    public static function post(string $key) {
        return isset($_POST[$key]) ? $_POST[$key] : null;
    }

    public static function config($key)
    {
        global $configs;
        return $configs[$key];
    }

    /**
     * 返回支持跨域的接送字符串
     *
     * @param array $data
     * @return void
     */
    public static function responseJson(array $data){
        echo json_encode($data);exit;
    }

    /**
     * 返回正确的json格式数据
     *
     * @param int $error
     * @param array $data
     * @param string $msg
     * @return array
     */
    public static function responseFormat(int $error,$data = null, $msg = ''){
        return[
            'error' => $error,
            'data' => $data,
            'msg' =>$msg,
        ];
    }
    /**
     * 格式化数据后直接返回
     */
    public static function responseFormatJson(int $error,$data = null, $msg = '') {
        $arr = [
            'error' => $error,
            'data' => $data,
            'msg' =>$msg,
        ];
        self::responseJson($arr);
    }

    /**
     * 将相对路径的静态资源转为完整URL
     * @param string $path
     * @return string
     */
    static public function resourceUrl(string $path) :string
    {
        return rtrim(Helpers::config('app_url'), '/')  . $path;
    }
}
