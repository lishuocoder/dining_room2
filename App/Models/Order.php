<?php


namespace App\Models;


use App\Common\Model;

class Order extends Model
{
    public $tableName = 'orders';

    public function getOrderFromOrderId(int $orderId) {

    }
    /**
     * 根据桌号获取订单
     */
    public function getOrdersFromDeskId($deskId = null, $status = null, $sort = 'asc') {
        $where = [];
        if ($deskId) {
            $where['desk_id'] = $deskId;
        }
        if ($status) {
            $where['status'] = $status;
        }
        if ($where) {
            $t = array_map(function ($row) {
                return sprintf("`%s`='%s'", $row[0], $row[1]);
            }, array_map(null, array_keys($where), array_values($where)));
            $whereString = implode(' and ', $t);
            $sql = sprintf('select * from #table# where %s order by id %s', $whereString, $sort);
        } else {
            $sql = 'select * from #table# order by id asc';
        }
        $orderModel = new Order();
        if (!$orders = $orderModel->query($sql)->fetchAll(\PDO::FETCH_ASSOC)) {
            return [];
        }
        foreach ($orders as $index => $order) {
            // $responseData = [
            //     'order' => $order,
            // ];
            $orderDetailModel = new OrderDetail();
            $orders[$index]['order_detail'] = $orderDetailModel->query(
                "select #table#.id, #table#.order_id, #table#.food_id, #table#.num, #table#.price as order_price, foods.id as food_id,foods.price as food_price,foods.img,foods.name from #table# left join `foods` on #table#.food_id=foods.id where order_id = {$order['id']}"
            )->fetchAll(\PDO::FETCH_ASSOC);
        }
        return $orders;
    }
}