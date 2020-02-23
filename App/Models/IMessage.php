<?php


namespace App\Models;

interface IMessage {
    /**
     * @return string
     */
    public function createContent(): string;
    /**
     * @return string
     */
    public function getType(): string;
    /**
     * @return array
     */
    public function getContent(): array;
}