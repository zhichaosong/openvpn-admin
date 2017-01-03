<?php
namespace app\admin\controller;

use think\Loader;

/**
* 用户留言
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Comment extends Admin
{	
	function _initialize()
	{
		parent::_initialize();
	}

	public function index()
	{
		if (request()->isAjax()) {
			$offset = input('get.offset', 0);
			$limit 	= input('get.limit', 10);

			$commentModel = Loader::model('Comment');
			$index = $commentModel->index($offset, $limit); //服务端分页，添加false第三个参数，在表格中将server改成client即可
			return $index;
		}
		return $this->fetch();
	}

    /**
     * 添加
     */
    public function add()
    {
        if( request()->isPost() ){
            $data = input('post.');
            $commentModel = Loader::model('Comment');
            $add = $commentModel->add($data);
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
        if(intval($id) < 0){
            return info(lang('Data ID exception'), 0);
        }
        if(request()->isPost()){
        	$data = input('post.');
            $commentModel = Loader::model('Comment');
            $edit = $commentModel->edit($data);
            return $edit;
        }
        $data = Loader::model('Comment')->get(['id'=>$id]);
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
        Loader::model('Comment')->deleteById($id);
    }

}
?>