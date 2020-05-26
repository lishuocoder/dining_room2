<?php
namespace App\Modules\Admin;

use App\Common\BaseController;
use App\Common\Helpers;
use App\Common\Request;
use App\Models\User;

class Controller extends BaseController{
    /**
     * __开头的方法是魔术方法,当控制器的方法为protected的时候,每次调用方法,会自动执行此魔术方法
     * 在此方法里做权限验证
     */
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