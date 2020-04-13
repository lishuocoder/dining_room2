<?php


namespace App\Common;


class Upload
{
    protected $filename;//文件名
    protected $fileMine;//文件上传类型
    protected $filepath;//文件上传路径
    protected $filemax;//文件上传大小
    protected $fileExt;//文件上传格式
    protected $fileerror;//文件出错设置
    protected $fileflag;//文件检测
    protected $fileinfo; //FILES
    protected $ext; //文件扩展
    protected $path;

    //文件上传
    public function __construct($filename = "N_File", $filemax = 5000000, $filepath = "Notices", $fileflag = true, $fileExt = array('gif', 'jpeg', 'pjpeg', 'jpg', 'png'), $fileMine = array('image/gif', 'image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png'))
    {
        $this->filename = $filename;
        $this->fileinfo = $_FILES[$this->filename];
        $this->filemax = $filemax;
        $this->filepath = $filepath;
        $this->fileflag = $fileflag;
        $this->fileExt = $fileExt;
        $this->fileMine = $fileMine;
    //var_dump($this->filename);
    }

    //错误判断
    public function UpError()
    {
        if ($this->fileinfo['error'] > 0) {
            switch ($this->fileinfo['error']) {
                case 1:
                    $this->fileerror = "上传文件大小超过服务器允许上传的最大值，php.ini中设置upload_max_filesize选项限制的值 ";
                    break;
                case 2:
                    $this->fileerror = "上传文件大小超过HTML表单中隐藏域MAX_FILE_SIZE选项指定的值";
                    break;
                case 3:
                    $this->fileerror = "文件部分被上传";
                    break;
                case 4:
                    $this->fileerror = "没有选择上传文件";
                    break;
                case 5:
                    $this->fileerror = "未找到临时目录";
                    break;
                case 6:
                    $this->fileerror = "文件写入失败";
                    break;
                case 7:
                    $this->fileerror = "php文件上传扩展没有打开";
                    break;
                case 8:
                    $this->fileerror = "";
                    break;
            }
            return false;
        }
        return true;
    }

    //检测文件类型
    public function UpMine()
    {
        if (!in_array($this->fileinfo['type'], $this->fileMine)) {
            $this->error = "文件上传类型不对";
            return false;
        }
        return true;
    }

    //检测文件格式
    public function UpExt()
    {
        $this->ext = pathinfo($this->fileinfo['name'], PATHINFO_EXTENSION);
        //var_dump($ext);
        if (!in_array($this->ext, $this->fileExt)) {
            $this->fileerror = "文件格式不对";
            return false;
        }
        return true;
    }

    //检测文件路径
    public function UpPath()
    {
        $mtime = date('Y-m-d');
        $this->filepath = $this->filepath . '/' . $mtime;
        if (!file_exists($this->filepath)) {
            mkdir($this->filepath, 0777, true);
        }
    }

    //检测文件大小
    public function UpSize()
    {
        $max = $this->fileinfo['size'];
        if ($max > $this->filemax) {
            $this->fileerror = "文件过大";
            return false;
        }
        return true;
    }

    //检测文件是否HTTP
    public function UpPost()
    {
        if (!is_uploaded_file($this->fileinfo['tmp_name'])) {
            $this->fileerror = "恶意上偿还";
            return false;
        }
        return true;
    }

    //文件名防止重复
    public function Upname()
    {
        return md5(uniqid(microtime(true), true));
    }

    //图片缩略图
    public function Smallimg($x = 300, $y = 300)
    {
        $imgAtt = getimagesize($this->path);
    //图像宽，高，类型
        $imgWidth = $imgAtt[0];
        $imgHeight = $imgAtt[1];
        $imgext = $imgAtt[2];
    //等比列缩放
        if (($x / $imgWidth) > ($y / $imgHeight)) {
            $bl = $y / $imgHeight;
        } else {
            $bl = $x / $imgWidth;
        }
        $x = floor($imgWidth * $bl); //缩放后
        $y = floor($imgHeight * $bl);
        $images = imagecreatetruecolor($x, $y);
        switch ($imgext) {
            case 1:
                $imageout = imagecreatefromgif($this->path);
                break;
            case 2:
                $imageout = imagecreatefromjpeg($this->path);
                break;
            case 3:
                $imageout = imagecreatefrompng($this->path);
                break;
            default:
                $imageout = imagecreatefromjpeg($this->path);
        }
        imagecopyresized($images, $imageout, 0, 0, 0, 0, $x, $y, $imgWidth, $imgHeight);
        $names = $this->Upname();
        $this->path = $this->filepath . '/' . $names . '.' . $this->ext;
        imagejpeg($images, $this->path);
        return $this->path;
    }

    //文件上传
    public function uploads()
    {
        if ($this->UpError() && $this->UpMine() && $this->UpExt() && $this->UpSize() && $this->UpPost()) {
            $this->UpPath();
            $names = $this->Upname();
            $this->path = $this->filepath . '/' . $names . '.' . $this->ext;
            if (move_uploaded_file($this->fileinfo['tmp_name'], $this->path)) {
                return $this->path;
            } else {
                $this->fileerror = "上传失败";
            }
        } else {
            exit("<b>" . $this->fileerror . "</b>");
        }
    }
}