<?php
namespace app\admin\controller;

use think\Db;
use think\Loader;



/**
* 用户留言
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Subject extends Admin
{	
	private $comment;
	function _initialize()
	{
		parent::_initialize();
		$this->comment = Db::table('ta_test_comments');
	}

	public function index()
	{
		if (request()->isAjax()) {
			/*$data = request()->param();
			$map = "1 = 1";
			$rows = $this->comment->where($map)->order('create_time desc')->select();
			foreach ($rows as $key => $value) {
				$rows[$key]['create_time'] = date("Y-m-d H:i:s" , $value['create_time']);
				$rows[$key]['opreate'] = [];
			}
			return $rows;*/
		}
		return $this->fetch();
	}
}
?>