<?php
namespace App\Common;

class Request
{
    private $get;
    private $post;
    private $request;
    private $server;

    public function __construct()
    {
        $this->get = $_GET;
        $this->post = $_POST;
        $this->request = $_REQUEST;
        $this->server = $_SERVER;
    }

    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    public function get($key = null)
    {
        if ($key === null) {
            return $this->get;
        }
        return $this->get[$key] ?? null;
    }

    public function post($key = null)
    {
        if ($key === null) {
            return $this->post;
        }
        return $this->post[$key] ?? null;
    }

    public function request($key = null)
    {
        if ($key === null) {
            return $this->request;
        }
        return $this->request[$key] ?? null;
    }

    public function server($key = null)
    {
        if ($key === null) {
            return $this->server;
        }
        return $this->server[$key] ?? null;
    }
}