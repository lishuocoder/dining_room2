<?php
namespace App\Modules\Admin\Controllers;

use App\Common\Helpers;
use App\Common\Request;
use App\Models\User;
use App\Modules\Admin\Controller;

class LoginController extends Controller
{
    public function loginAction(Request $request)
    {
        $email = $request->post('email');
        $password = $request->post('password');
        if (!$email || !$password) {
            Helpers::responseFormatJson(402, null, '请填写邮箱和密码');
        }
        $userModel = new User();
        $user = $userModel->query('select * from #table# where email=:email and password=:password', ['email' => $email, 'password' => md5($password)])->fetch(\PDO::FETCH_ASSOC);
        if (!$user) {
            Helpers::responseFormatJson(403, null, '邮箱或密码不正确');
        }
        $apiToken = uniqid();
        $userModel->exec('update #table# set api_token=:api_token where id=:id', ['api_token' => $apiToken, 'id' => $user['id']]);
        Helpers::responseFormatJson(0, ['api_token' => $apiToken], '登录成功');
    }
}