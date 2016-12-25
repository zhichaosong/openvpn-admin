<?php
namespace app\admin\controller;

use think\Db;
use think\Config;
use think\Cache;
use think\View;


/**
* 
*/
class Test extends Admin
{
	public function index()
	{

		return $this->fetch();
	}

	public function read($id = 0)
	{	

		return view();
	}

	// 模态框
	public function add()
	{
		return view();
	}

	// 本页打开 单页
	public function addSelf()
	{
		return view();
	}

	// 本页打开 多页
	public function addManyPage()
	{
		return view();
	}

}


?>