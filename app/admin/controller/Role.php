<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;
use think\Db;

/**
* 角色管理
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Role extends Admin
{
    private $role;
    function _initialize()
    {
        parent::_initialize();
        $this->role = Loader::model('role');
    }

    /**
     * 列表
     */
    public function index()
    {
        if(request()->isAjax()){
            $data = $this->role->select();
            return $data;
        }
        return view();
    }

    public function access_menu()
    {
        return view();
    }
}