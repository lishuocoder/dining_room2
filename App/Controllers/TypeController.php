<?php

namespace App\Controllers;

use App\Common\BaseController;
use App\Common\Helpers;
use App\Models\Type;

class TypeController extends BaseController
{
    public function indexAction()
    {
        $model = new Type();
        $sql = 'select * from `#table#` where `status`=1 order by `sort` asc';

        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );
    }
}
