<?php

namespace App\Controllers;

use App\Common\BaseController;
use App\Models\Food;
use App\Common\Helpers;

class FoodController extends BaseController
{
    public function indexAction(){
        $type_id = \App\Common\Helpers::get('type_id');
        if ($type_id == null) {
            $sql = 'select * from `#table#` where `status`=1 order by `sort` asc';
        } else {
            $sql = "select * from `#table#` where `status`=1 and type_id = '$type_id' order by `sort` asc";
        }
        $model =new Food();
        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
        $rows = array_map(function ($row) {
            $row['img'] = Helpers::resourceUrl($row['img']);
            return $row;
        }, $rows);

        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );


    }
}
