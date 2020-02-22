<?php
namespace App\Modules\Admin\Controllers;

use App\Common\Helpers;
use App\Common\Request;
use App\Connection\Database;
use App\Models\Desk;
use App\Models\Order;
use App\Modules\Admin\Controller;

class IndexController extends Controller{
    
    public function indexAction() {
        echo __FILE__;
    }
    
    /**
     * 餐桌列表,包含所属订单
     */
    protected function desksAction(Request $request) {
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
                $desks[$index]['order'] = $orderModel->getOrderFromDeskId($desk['id'], $desk['status']);
            }
        }
        echo Helpers::responseJson(Helpers::responseFormat(0, $desks));
    }
    /**
     * 订单查询接口
     */
    public function orderAction() {
        $orderId = Helpers::get('order_id');
        $orderModel = new Order();
        if (!$order = $orderModel->getOrderFromOrderId($orderId)) {
            echo Helpers::responseJson(Helpers::responseFormat(10, null, '订单不存在'));
        } else {
            echo Helpers::responseJson(Helpers::responseFormat(0, $order));
        }
    }

    /**
     * 修改订单状态
     */
    public function changeOrderStatusAction() {
        $orderId = Helpers::post('order_id');
        $orderStatus = Helpers::post('status');

        $orderStatusMap = [1, 3];//1：结账 2：未结账 3：异常
        if (!in_array($orderStatus, $orderStatusMap)) {
            echo Helpers::responseFormatJson(11, null, '状态值非法');
        }
        $orderModel = new Order();
        //检查订单状态
        $order = $orderModel->getOrderFromOrderId($orderId);
        if (!$order) {
            Helpers::responseFormatJson(10, null, '订单不存在');
        }
        Database::connect()->beginTransaction();
        //修改订单状态
        if (!$orderModel->exec("update #table# set status = :status where id = :id", ['status' => $orderStatus, 'id' => $orderId])) {
            Database::connect()->rollBack();
            Helpers::responseFormatJson(100, null, '订单状态修改失败');
        }
        //不论订单状态是1还是3,都把餐桌改为空闲
        $deskModel = new Desk();
        if (!$deskModel->exec("update #table# set status = 1 where id = {$order['desk_id']}")) {
            Database::connect()->rollBack();
            Helpers::responseFormatJson(100, null, '餐桌状态修改失败');
        }
        Database::connect()->commit();
        Helpers::responseFormatJson(0, null, 'OK');
    }
}