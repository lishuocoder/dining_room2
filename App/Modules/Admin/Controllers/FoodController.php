<?php

namespace App\Modules\Admin\Controllers;

use App\Models\Food;
use App\Common\Helpers;
use App\Modules\Admin\Controller;

class FoodController extends Controller
{
    protected function indexAction(){
        $type_id = \App\Common\Helpers::get('type_id');
        if ($type_id == null) {
            $sql = 'select * from `#table#` order by `sort` asc';
        } else {
            $sql = "select * from `#table#` and type_id = '$type_id' order by `sort` asc";
        }
        $model =new Food();
        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);


        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );


    }
}