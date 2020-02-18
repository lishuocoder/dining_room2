<?php


namespace App\Models;


use App\Common\Model;

class Order extends Model
{
    public $tableName = 'orders';
    /**
     * 通过订单ID获取订单详情
     */
    public function getOrderFromOrderId($orderId) {
        $orderModel = new Order();
        if (!$order = $orderModel->query("select * from #table# where id = :id", ['id' => $orderId])->fetch(\PDO::FETCH_ASSOC)) {
            return null;
        }
        $order['order_detail'] = $this->getOrderDetailFromOrderId($orderId);
        return $order;
    }

    /**
     * 根据桌号获取订单列表
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
            $orders[$index]['order_detail'] = $this->getOrderDetailFromOrderId($order['id']);
        }
        return $orders;
    }

    /**
     * 根据桌号获取当前正在就餐的订单(一个)
     */
    public function getOrderFromDeskId($deskId = null) {
        $where = [];
        if ($deskId) {
            $where['desk_id'] = $deskId;
        }
        $where['status'] = 2;
        if ($where) {
            $t = array_map(function ($row) {
                return sprintf("`%s`='%s'", $row[0], $row[1]);
            }, array_map(null, array_keys($where), array_values($where)));
            $whereString = implode(' and ', $t);
            $sql = sprintf('select * from #table# where %s order by id %s limit 1', $whereString, 'desc');
        } else {
            $sql = 'select * from #table# order by id asc limit 1';
        }
        $orderModel = new Order();

        if (!$order = $orderModel->query($sql)->fetch(\PDO::FETCH_ASSOC)) {
            return null;
        }
        $order['order_detail'] = $this->getOrderDetailFromOrderId($order['id']);

        return $order;
    }

    /**
     * 根据订单ID查找订单详情
     */
    public function getOrderDetailFromOrderId($orderId) {
        $orderDetailModel = new OrderDetail();
        return $orderDetailModel->query(
            "select #table#.id, #table#.order_id, #table#.food_id, #table#.num, #table#.price as order_price, foods.id as food_id,foods.price as food_price,foods.img,foods.name from #table# left join `foods` on #table#.food_id=foods.id where order_id = {$orderId}"
        )->fetchAll(\PDO::FETCH_ASSOC);
    }
}