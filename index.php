<?php
//
require './vendor/autoload.php';

$c = \App\Common\Helpers::get('c');
$a = \App\Common\Helpers::get('a');
$m = \App\Common\Helpers::get('m');

if (!$c || !$a) {
    throw new Exception('c和a不可为空');
}
if ($m) {
    $c = '\App\Modules\\' . ucfirst($m) . '\Controllers\\' . ucfirst($c) . 'Controller';
} else {
    $c = '\App\Controllers\\' . ucfirst($c) . 'Controller';
}
$a = $a . 'Action';

if (!class_exists($c)) {
    throw new Exception($c . '不存在'); //class_exists检查类是否存在
}

if (!method_exists($c, $a)) {
    throw new Exception($a . '不存在');
}

$controller = new $c;
$controller->$a();
