<?php
namespace App\Modules\Admin;

use App\Common\BaseController;
use App\Common\Helpers;
use App\Common\Request;
use App\Models\User;

class Controller extends BaseController{

    public function __call($method, $argc)
    {
        if ($apiToken = $argc[0]->get('api_token')) {
            Helpers::responseFormatJson(401, null, '请登录');
        }
        $userModel = new User();
        $user = $userModel->query("select * from `#table#` where `api_token` = :api_token", ['api_token' => $apiToken])->fetch(\PDO::FETCH_ASSOC);
        if (!$user) {
            Helpers::responseFormatJson(402, null, '请重新登录');
        }
        $argc[0]->user = $user;
        call_user_func_array([$this, $method], $argc);
    }
}