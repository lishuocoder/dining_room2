<?php

namespace App\Controllers;

use App\Common\Helpers;
use App\Models\Food;
use App\Models\Recommend;

class RecommendController
{
    public function indexAction() {
        $place = Helpers::get('place');
        $sql = "select food_id from `#table#` where `place` = '$place'";
        $model = new Recommend();
        $foodIds = $model->query($sql)->fetchAll(\PDO::FETCH_COLUMN);
        $ids = implode(',', $foodIds);
        $sql2 = "select * from `#table#` where id in ($ids)";
        $foodModel = new Food();
        $rows = $foodModel->query($sql2)->fetchAll(\PDO::FETCH_ASSOC);
        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );
    }
}