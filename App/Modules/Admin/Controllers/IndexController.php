<?php
namespace App\Modules\Admin\Controllers;

use App\Common\Helpers;
use App\Models\Desk;
use App\Models\Order;

class IndexController {
    public function indexAction() {
        echo __FILE__;
    }
    /**
     * 餐桌列表,包含所属订单
     */
    public function desksAction() {
        $deskModel = new Desk();
        $orderModel = new Order();
        //status 1:空闲 2:使用中
        $sql = "select id, status from #table#";
        //所有餐桌
        $desks = $deskModel->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
        //遍历餐桌
        foreach ($desks as $index => $desk) {
            //如果是使用中状态,则查看相关订单
            if ($desk['status'] == 2) {
                $desks[$index]['order'] = $orderModel->getOrdersFromDeskId($desk['id'], $desk['status']);
            }
        }
        echo Helpers::responseJson(Helpers::responseFormat(0, $desks));
    }

    public function orderAction() {
        $orderId = Helpers::get('order_id');
        $orderModel = new Order();
        if (!$order = $orderModel->getOrderFromOrderId($orderId)) {
            echo Helpers::responseJson(Helpers::responseFormat(10, null, '订单不存在'));
        } else {
            echo Helpers::responseJson(Helpers::responseFormat(0, $order));
        }

    }
}