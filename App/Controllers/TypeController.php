<?php

namespace App\Controllers;

use App\Common\Helpers;
use App\Models\Type;

class TypeController
{
    public function indexAction()
    {
        $model = new Type();
        $sql = 'select * from `#table#` where `status`=1 order by `sort` asc';

        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        Helpers::responseJson($rows);
    }
}
