<?php


namespace App\Controllers;

use App\Common\BaseController;
use App\Common\Helpers;
use App\Connection\Database;
use App\Models\Desk;
use App\Models\Food;
use App\Models\Message;
use App\Models\MessageOrder;
use App\Models\Order;
use App\Models\OrderDetail;
use Exception;

class OrderController extends BaseController
{
    /**
     * @return void
     */
    public function indexAction() {
        $deskId = Helpers::get('desk_id');
        $orderModel = new Order();
        //找到当前未结算的订单
        $order = $orderModel->query(
            'select * from #table# where desk_id = :desk_id and status = 2 order by id asc limit 1',
            ['desk_id' => $deskId]
        )->fetch(\PDO::FETCH_ASSOC);
        if (!$order) {
            Helpers::responseJson(
                Helpers::responseFormat(0, null, 'OK')
            );
        }
        $responseData = [
            'order' => $order,
        ];
        $orderDetailModel = new OrderDetail();
        $responseData['order']['order_detail'] = $orderDetailModel->query(
            "select #table#.id, #table#.order_id, #table#.food_id, #table#.num, #table#.price as order_price, foods.id as food_id,foods.price as food_price,foods.img,foods.name from #table# left join `foods` on #table#.food_id=foods.id where order_id = {$order['id']}"
    )->fetchAll(\PDO::FETCH_ASSOC);
	$responseData['order']['order_detail'] = array_map(function ($row) {
            $row['img'] = Helpers::resourceUrl($row['img']);
            return $row;
        }, $responseData['order']['order_detail']);

        Helpers::responseJson(
            Helpers::responseFormat(1, $responseData, 'ok')
        );
    }

    /**
     * 创建订单
     * @throws Exception
     */
    public function createAction() {
        $deskId = Helpers::post('desk_id');
        /** @var string $foods '[{"food_id":1, "num":2},{"food_id":2, "num":1}]'*/
        $foods = Helpers::post('foods');
        if (!$deskId || !$foods) {
            Helpers::responseJson(
                Helpers::responseFormat(400, [], 'desk_id,foods为必选参数')
            );
        }
        if (!$foodsArr = json_decode($foods, true)) {
            Helpers::responseJson(
                Helpers::responseFormat(400, null, 'foods格式错误')
            );
        } else {
            $foodModel = new Food();
            foreach ($foodsArr as $index => $food) {
                if (!isset($food['food_id']) || !isset($food['num'])) {
                    Helpers::responseJson(
                        Helpers::responseFormat(400, null, 'food格式错误')
                    );
                }
                $foodDetail = $foodModel->query('select * from #table# where id=:id', ['id' => $food['food_id']])->fetch(\PDO::FETCH_ASSOC);
                if (!$foodDetail) {
                    Helpers::responseJson(
                        Helpers::responseFormat(400, null, 'food_id不存在')
                    );
                }
                $foodsArr[$index]['food_detail'] = $foodDetail;
            }
        }
        $nowTime = date('Y-m-d H:i:s');
        Database::connect()->beginTransaction();
        //修改餐桌状态
        $deskModel = new Desk();
        $desk = $deskModel->query("select * from #table# where `id` = :id", ['id' => $deskId])
            ->fetch(\PDO::FETCH_ASSOC);
        if (!$desk) {
            Helpers::responseJson(
                Helpers::responseFormat(400, null, 'desk_id不存在')
            );
        }
        if ($desk['status'] == 1) {
            $deskModel->exec('update #table# set `status`=2 where `id`=:id', ['id' => $deskId]);
        }
        //订单是否有为结账的订单,如果有,就继续追加菜,如果没有,就新建订单,再追加菜
        $orderModel = new Order();
        $order = $orderModel->query(
            'select `id`, `start_time`, `status`, `price`, `desk_id` from #table# where desk_id = :desk_id and status = 2', ['desk_id' => $deskId]
        )->fetch(\PDO::FETCH_ASSOC);
        if (!$order) {
            $orderData = [
                'start_time' => $nowTime,
                'status' => 2,
                'price' => '0',
                'desk_id' => $deskId,
            ];
            $orderId = $orderModel->insert($orderData);
            $orderData['id'] = $orderId;
            $order = $orderData;
        }
        //增加订单详情
        $amount = 0;
        foreach ($foodsArr as $food) {
            $price = $food['food_detail']['price'] * $food['num'];
            $foodData = [
                'order_id' => $order['id'],
                'food_id' => $food['food_id'],
                'num' => $food['num'],
                'price' => $price,
                'order_detail_time' => $nowTime
            ];
            $orderDetailModel = new OrderDetail();
            $orderDetailModel->insert($foodData);
            $amount += $price;
            //增加菜的销量
            $foodModel->exec("update #table# set `sales_volume` = `sales_volume`+{$food['num']} where id = {$food['food_id']}");
        }
        $orderModel->exec('update #table# set `price`=`price`+:price where `id`=:id', ['price' => $amount, 'id' => $order['id']]);
        //添加消息
        $messageOrder = new MessageOrder();
        $messageOrder->deskId = $deskId;
        $messageOrder->orderId = $order['id'];
        Message::send($messageOrder);

        Database::connect()->commit();
        Helpers::responseJson(
            Helpers::responseFormat(0, null, 'OK')
        );
    }
}
