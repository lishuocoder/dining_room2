<?php

namespace App\Controllers;

use App\Common\Helpers;
use App\Models\Banner;

class BannerController
{
    public function indexAction()
    {
        $model = new Banner();
        $sql = 'select * from `#table#` where `status`=1 order by `sort` asc';
        $rows = $model->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

        Helpers::responseJson(
            Helpers::responseFormat(0, $rows, 'ok')
        );
    }
}
