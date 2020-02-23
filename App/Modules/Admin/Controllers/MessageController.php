<?php


namespace App\Modules\Admin\Controllers;


use App\Common\BaseController;
use App\Common\Helpers;
use App\Models\Message;
use App\Modules\Admin\Controller;

class MessageController extends Controller
{
    /**
     * @throws \Exception
     */
    protected function oneAction()
    {
        if (!$msg = Message::getOne()) {
            Helpers::responseFormatJson(0, null);
        }
        Helpers::responseFormatJson(0, $msg);
    }
}