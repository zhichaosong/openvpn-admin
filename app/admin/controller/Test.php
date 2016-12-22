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

}


?>