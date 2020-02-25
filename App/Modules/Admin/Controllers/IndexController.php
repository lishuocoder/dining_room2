<?php
namespace App\Modules\Admin\Controllers;

use App\Common\Helpers;
use App\Common\Request;
use App\Connection\Database;
use App\Models\Desk;
use App\Models\Food;
use App\Models\Order;
use App\Models\OrderDetail;
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
        $sql = "select `id`, `status` from #table#";
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
    protected function orderAction() {
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
    protected function changeOrderStatusAction() {
        $orderId = Helpers::post('order_id');
        $orderStatus = Helpers::post('status');

        $orderStatusMap = [1, 3, 4];//1：结账 2：未结账 3：异常 4:取消订单
        if (!in_array($orderStatus, $orderStatusMap)) {
            Helpers::responseFormatJson(11, null, '状态值非法');
        }
        $orderModel = new Order();
        //检查订单状态
        $order = $orderModel->getOrderFromOrderId($orderId);
        if (!$order) {
            Helpers::responseFormatJson(10, null, '订单不存在');
        }
        Database::connect()->beginTransaction();
        //修改订单状态
        if (!$orderModel->exec("update #table# set `status` = :status where `id` = :id", ['status' => $orderStatus, 'id' => $orderId])) {
            Database::connect()->rollBack();
            Helpers::responseFormatJson(100, null, '订单状态修改失败');
        }
        //不论订单状态是1,3还是4,都把餐桌改为空闲
        $deskModel = new Desk();
        if (!$deskModel->exec("update #table# set `status` = 1 where `id` = {$order['desk_id']}")) {
            Database::connect()->rollBack();
            Helpers::responseFormatJson(100, null, '餐桌状态修改失败');
        }
        Database::connect()->commit();
        Helpers::responseFormatJson(0, null, 'OK');
    }

    /**
     * 修改订单菜品数量
     * @throws \Exception
     */
    protected function changeOrderNumAction()
    {
        $orderId = Helpers::post('order_id');
        $action = Helpers::post('action');//incr decr
        $orderDetailId = Helpers::post('order_detail_id');
        if (!$orderId || !$action || !$orderDetailId) {
            Helpers::responseFormatJson(13, null, 'order_id, action, order_detail_id为必填');
        }

        $actionMap = ['incr', 'decr'];
        if (!in_array($action, $actionMap)) {
            Helpers::responseFormatJson(11, null, 'action参数非法');
        }
        $orderModel = new Order();
        //检查订单状态
        $order = $orderModel->getOrderFromOrderId($orderId);
        if (!$order) {
            Helpers::responseFormatJson(10, null, '订单不存在');
        }
        if ($order['status'] == 1) {
            Helpers::responseFormatJson(10, null, '已结束的订单不支持修改');
        }
        Database::connect()->beginTransaction();
        $orderDetailModel = new OrderDetail();
        //查询子订单
        $orderDetail = $orderDetailModel->query("select * from #table# where `order_id`=:order_id and id=:id", ['order_id' => $orderId, 'id' => $orderDetailId])->fetch(\PDO::FETCH_ASSOC);
        if (!$orderDetail) {
            Helpers::responseFormatJson(10, null, '子订单不存在');
        }
        //查询菜的数据
        $foodModel = new Food();
        $food = $foodModel->query('select * from #table# where id = :id', ['id' => $orderDetail['food_id']])->fetch(\PDO::FETCH_ASSOC);
        if ($action == 'incr') {
            $sql = "update #table# set `num` = `num`+1 where `id` = {$orderDetailId}";
            $changeOrderPriceSql = "update #table# set `price`=`price`+ {$food['price']} where `id`={$orderId}";
        } else {
            if ($orderDetail['num'] <= 0) {
                Helpers::responseFormatJson(10, null, '数量不可小于0');
            }
            $sql = "update #table# set `num` = `num`-1 where `id` = {$orderDetailId}";
            $changeOrderPriceSql = "update #table# set `price`=`price`- {$food['price']} where `id`={$orderId}";
        }
        if ($orderDetailModel->exec($sql) && $orderModel->exec($changeOrderPriceSql)) {
            Database::connect()->commit();
            Helpers::responseFormatJson(0, null, 'OK');
        } else {
            Database::connect()->rollBack();
            Helpers::responseFormatJson(13, null, '数量修改失败');
        }
    }

    /**
     * 修改菜品状态
     * @throws \Exception
     */
    protected function foodStatusAction()
    {
        $foodId = Helpers::post('food_id');
        $status = Helpers::post('status');//状态(1：上架 0：下架)
        if (!$foodId || $status === null) {
            Helpers::responseFormatJson(11, null, 'food_id,status必填');
        }
        $statusMap = [1, 0];
        if (!in_array($status, $statusMap)) {
            Helpers::responseFormatJson(11, null, 'stats非法');
        }
        $foodModel = new Food();
        if (!$foodModel->exec('update #table# set `status` = :status, `updated_at`=:updated_at where id = :id', [
            'status' => $status,
            'id' => $foodId,
            'updated_at' => date('Y-m-d H:i:s')
        ])) {
            Helpers::responseFormatJson(11, null, '修改失败');
        }
        Helpers::responseFormatJson(0, null, 'OK');

    }
}