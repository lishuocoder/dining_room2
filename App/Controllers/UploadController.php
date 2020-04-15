<?php


namespace App\Controllers;


use App\Common\BaseController;
use App\Common\Helpers;
use App\Common\Upload;

class UploadController extends BaseController
{
    /**
     * http://127.0.0.1:8088/?c=upload&a=uploadImg
     */
    public function uploadImgAction()
    {
        $upload = new Upload('img', 5000000, 'upload');
        $u = $upload->uploads();
        $s = $upload->Smallimg(300, 150);
        Helpers::responseFormatJson(0, [
            'img' => Helpers::config('app_url') . $u,
            'thumb_img' => Helpers::config('app_url') . $s
        ], 'OK');
    }
}