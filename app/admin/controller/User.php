<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;
use think\Db;
use think\Config;


/**
* 用户管理
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class User extends Admin
{

    function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 列表
     */
    public function index()
    {
        if(request()->isAjax()) {

            $data = request()->param();
            $userModel = Loader::model('User');
            $index = $userModel->index($data);
            return $index;
        }
        return view();
    }

    /**
     * 添加
     */
    public function add()
    {
        if( request()->isPost() ){
            $data = input('post.');
            $userModel = Loader::model('User');
            $add = $userModel->add($data);
            return $add;
        }
        return $this->fetch('edit');
    }

    /**
     * 编辑
     * @param  string $id 数据ID（主键）
     */
    public function edit($id = 0)
    {   
        $data = request()->param();
        $id = intval($data['id']);
        if(empty($id)){
            return info(lang('Data ID exception'), 0);
        }
        if(request()->isPost()){
            $userModel = Loader::model('User');
            $edit = $userModel->edit($data);
            return $edit;
        }
        $data = Loader::model('User')->finduserById($id);
        $this->assign('data',$data);
        return $this->fetch();
    }

    /**
     * 删除
     * @param  string $id 数据ID（主键）
     */
    public function delete($id = 0){
        if(empty($id)){
            return info(lang('Data ID exception'), 0);
        }
        Loader::model('User')->deleteById($id);
    }

   
}