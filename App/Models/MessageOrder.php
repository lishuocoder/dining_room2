<?php

namespace App\Models;

/**
 * Class MessageOrder
 */
class MessageOrder implements IMessage
{
    public $deskId;
    public $orderId;

    /**
     * @return string
     */
    public function getType(): string
    {
        return 'order';
    }

    /**
     * @return string
     */
    public function createContent(): string
    {
        $contentArr = [
            'desk_id' => $this->deskId,
            'order_id' => $this->orderId,
        ];
        return json_encode($contentArr);
    }

    /**
     * @return array
     */
    public function getContent(): array
    {
        return [
            'desk_id' => $this->deskId,
            'order_id' => $this->orderId
        ];
    }

}