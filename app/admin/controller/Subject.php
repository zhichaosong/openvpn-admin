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
		$this->comment = Db::table('test_comments');
	}

	public function index()
	{
		if (request()->isAjax()) {
			$data = request()->param();
			$map = "1 = 1";
			$rows = $this->comment->where($map)->order('create_time desc')->select();
			foreach ($rows as $key => $value) {
				$rows[$key]['create_time'] = date("Y-m-d H:i:s" , $value['create_time']);
			}
			return $rows;
		}
		return $this->fetch();
	}


	/**
	 * 添加
	 */
	public function add()
	{
		if (request()->isPost()) {
			$data = request()->param();
			$data['create_time'] = time();
			$res = $this->comment->insert($data);
			if ($res == 1) {
				Loader::model('LogRecord')->record('用户留言-添加成功');
				return info("添加成功!",1);
			}else{
				Loader::model('LogRecord')->record('用户留言-添加失败 data='.serialize($data));
				return info("添加失败!",0);
			}
		}		
		return $this->fetch('edit');
	}


	/**
	 * 编辑
	 */
	public function edit($id = 0)
	{
		if(intval($id) < 0){
			return info("数据ID异常",0);
			exit;
		}
		if (request()->isPost()) {
			$data = request()->param();
			$res = $this->comment->update($data);
			if ($res == 1) {
				Loader::model('LogRecord')->record('用户留言-编辑成功 ID='.$id);
				return info("编辑成功!",1);
			}else{
				Loader::model('LogRecord')->record('用户留言-编辑失败 ID='.$id);
				return info("编辑失败!",0);
			}
		}		
		$data = $this->comment->where('id',$id)->find();
		$this->assign('data',$data);
		return $this->fetch();
	}

	public function delete($id = 0)
	{
		
	}

}
?>