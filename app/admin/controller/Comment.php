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
}
?>