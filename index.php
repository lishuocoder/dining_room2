<?php
//设置返回值为json
header('Content-Type: application/json; charset=UTF-8');
//设置支持跨域
header('Access-Control-Allow-Origin:*');
//声明使用Request类
use App\Common\Request;
//设置默认时区
date_default_timezone_set("Asia/Shanghai");
//引入自动加载工具
require './vendor/autoload.php';
//声明全局配置文件变量
global $configs;
//引入配置文件
$configs = require_once './config.php';  //require_once 加载文件一次
//get方法接收参数
$c = \App\Common\Helpers::get('c');
$a = \App\Common\Helpers::get('a');
$m = \App\Common\Helpers::get('m');
//c和a为必选参数
if (!$c || !$a) {
    throw new Exception('c和a不可为空');
}
//根据传入的参数,拼接对应控制器的命名空间
if ($m) {
    //拼接成的命名空间示例
    //\App\Modules\Admin\Controllers\IndexController
    $c = '\App\Modules\\' . ucfirst($m) . '\Controllers\\' . ucfirst($c) . 'Controller';
} else {
    //\App\Modules\Controllers\IndexController
    $c = '\App\Controllers\\' . ucfirst($c) . 'Controller';
}
//拼接方法名称,如indexAction
$a = $a . 'Action';
//检查类是否存在
if (!class_exists($c)) {
    throw new Exception($c . '不存在'); //class_exists检查类是否存在
}
//检查方法是否存在
if (!method_exists($c, $a)) {
    throw new Exception($a . '不存在');
}
//实例化控制器
$controller = new $c;
//调用控制器方法
$controller->$a(new Request);
