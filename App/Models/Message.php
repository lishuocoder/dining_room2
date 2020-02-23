<?php
namespace App\Models;

use App\Common\Model;

/**
 * Class Messages
 */
class Message extends Model
{
    public $tableName = 'messages';

    /**
     * @param IMessage $iMessage
     *
     * @return string
     * @throws \Exception
     */
    static public function send(IMessage $iMessage)
    {
        $contentJson = $iMessage->createContent();
        $model = new Message();
        return $model->insert([
            'type' => $iMessage->getType(),
            'status' => 1,
            'content' => $contentJson,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
    }

    /**
     * @return bool|mixed
     * @throws \Exception
     */
    static public function getOne()
    {
        $model = new Message();
        $row = $model->query('select * from `#table#` where `status` = 1 order by id asc limit 1')->fetch(\PDO::FETCH_ASSOC);
        if (!$row) {
            return false;
        }
        $row['content'] = json_decode($row['content'], true);
        $model->exec('update `#table#` set `status` = 2 where `id` = :id', ['id' => $row['id']]);
        return $row;
    }
}
