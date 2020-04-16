<?php

namespace App\Modules\Admin\Controllers;

use App\Models\Food;
use App\Common\Helpers;
use App\Modules\Admin\Controller;

class FoodController extends Controller
{
    /**
     * 菜品列表
     * @throws \Exception
     */
    protected function indexAction(){
        $type_id = \App\Common\Helpers::get('type_id');
        if ($type_id == null) {
            $sql = 'select * from `#table#` order by `sort` asc';
        } else {
            $sql = "select * from `#table#` where type_id = '$type_id' order by `sort` asc";
        }
        $model =new Food();
        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);


        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );
    }

    /**
     * 新增菜
     * @throws \Exception
     */
    protected function createAction() {
        $datetime = date('Y-m-d H:i:s');
        $data = [
            'status' => Helpers::post('status'),//状态(1：上架 0：下架,)
            'name' => Helpers::post('name'),
            'explain' => Helpers::post('explain'),
            'price' => Helpers::post('price'),
            'img' => Helpers::post('img'),
            'type_id' => Helpers::post('type_id'),
            'sort' => Helpers::post('sort'),
            'content' => Helpers::post('content'),
            'created_at' => $datetime,
            'updated_at' => $datetime,
            'sales_volume' => 0,
        ];
        $foodModel = new Food();
        try {
            $insert = $foodModel->insert($data);
        } catch (\Exception $exception) {
            Helpers::responseFormatJson(11, null, $exception->getMessage());
            return;
        }
        if (!$insert) {
            Helpers::responseFormatJson(11, null, '保存失败');
        }
        Helpers::responseFormatJson(0, null, 'OK');
    }


    /**
     * 修改菜
     * @throws \Exception
     */
    protected function updateAction()
    {
        $foodId = Helpers::post('food_id');
        if (!$foodId) {
            Helpers::responseFormatJson(11, null, 'food_id必填');
        }
        $data = [
            'status' => Helpers::post('status'),//状态(1：上架 0：下架,)
            'name' => Helpers::post('name'),
            'explain' => Helpers::post('explain'),
            'price' => Helpers::post('price'),
            'img' => Helpers::post('img'),
            'type_id' => Helpers::post('type_id'),
            'sort' => Helpers::post('sort'),
            'content' => Helpers::post('content'),
            'updated_at' => date('Y-m-d H:i:s'),
        ];
        $foodModel = new Food();
        try {
            $update = $foodModel->update($data, 'id=:id', ['id' => $foodId]);
        } catch (\Exception $exception) {
            Helpers::responseFormatJson(11, null, $exception->getMessage());
            return;
        }
        if (!$update) {
            Helpers::responseFormatJson(11, null, '修改失败');
        }
        Helpers::responseFormatJson(0, null, 'OK');
    }
}