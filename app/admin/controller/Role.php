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
        return view();
    }

    public function getList()
    {
        if(!request()->isAjax()) {
            $this->error(lang('Request type error'), 4001);
        }

        $request = request()->param();
        $data = model('Role')->getList( $request );
        return $data;
    }

    public function add()
    {
        return $this->fetch('edit');
    }


    public function edit($id = 0)
    {
        $id = input('id', '', 'intval');
        $data = model('role')->get(['id'=>$id]);
        $this->assign('data', $data);
        return $this->fetch();
    }

    public function saveData()
    {
        if( !request()->isAjax() ) {
            $this->error(lang('Request type error'));
        }
        $data = input('post.');
        return model('role')->saveData( $data );
    }

    /**
     * 删除
     * @param  string $id 数据ID（主键）
     */
    public function delete($id = 0){
        if(empty($id)){
            return info(lang('Data ID exception'), 0);
        }
        return model('Role')->deleteById($id);
    }
}