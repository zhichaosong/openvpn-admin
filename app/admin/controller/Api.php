<?php

namespace app\admin\controller;

use app\common\controller\Common;
use think\Loader;
use \app\admin\model\Key;
use \app\admin\model\User;

/**
 * 证书下载
 * @author zhichaosong github  https://github.com/zhichaosong
 * @version 1.0
 */
class Api extends Common
{

    function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 生成证书
     * @params mobile
     * @params username
     */
    public function generate()
    {
        $data = input();
        if (empty($data['mobile']) || empty($data['username'])) {
            return lang('Request params error');
        }
        $user = User::get($data);
        if(empty($user)){
            return lang('User not found');
        }

        $data = ['user_id' => $user['id']];
        $res = model('Key')->saveData( $data );
        return json_encode($res);
    }

    /**
     * 下载证书
     * @params mobile
     * @params pwd
     */
    public function download()
    {
        $data = input();
        if (empty($data['pwd']) || empty($data['mobile'])) {
            return lang('Request params error');
        }

        $user = User::get(['mobile' => $data['mobile']]);
        $where = ['user_id' => $user['id'], 'pwd' => $data['pwd'], 'status' => 0];
        $res = Key::get($where);
        if(empty($res)){
            return lang('Key not found');
        }
        Key::update(['status'=>2],$where);
        $file_name = "client.ovpn";     //下载文件名
//        $file_dir = "easy-rsa/keys/";        //下载文件存放目录
        $file_path = $res['path'];
        //检查文件是否存在
        if (!file_exists($file_path)) {
            return lang('File not found');
        } else {
            //打开文件
            $file = fopen($file_path, "r");
            //输入文件标签
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length: " . filesize($file_path));
            Header("Content-Disposition: attachment; filename=" . $file_name);
            //输出文件内容
            //读取文件内容并直接输出到浏览器
            echo fread($file, filesize($file_path));
            fclose($file);
        }
    }

}