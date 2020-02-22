<?php
namespace App\Modules\Admin;

use App\Common\BaseController;
use App\Common\Helpers;
use App\Common\Request;
use App\Models\User;

class Controller extends BaseController{

    public function __call($method, $argc)
    {
        if ((!$token = $argc[0]->request('token')) && (!$token = $argc[0]->server('HTTP_TOKEN'))) {
            Helpers::responseFormatJson(401, null, '请登录');
        }
        $userModel = new User();
        $user = $userModel->query("select * from `#table#` where `token` = :token", ['token' => $token])->fetch(\PDO::FETCH_ASSOC);
        if (!$user) {
            Helpers::responseFormatJson(402, null, '请重新登录');
        }
        $argc[0]->user = $user;
        call_user_func_array([$this, $method], $argc);
    }
}