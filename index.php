<?php

require './vendor/autoload.php';

$c = \App\Common\Helpers::get('c');
$a = \App\Common\Helpers::get('a');

if (!$c || !$a) {
    throw new Exception('c和a不可为空');
}
$c = '\App\Controllers\\' . ucfirst($c) . 'Controller';
$a = $a . 'Action';

if (!class_exists($c)) {
    throw new Exception($c . '不存在');
}

if (!method_exists($c, $a)) {
    throw new Exception($a . '不存在');
}

// var_dump(\App\Connection\Database::connect());exit;
$controller = new $c;
$controller->$a();
