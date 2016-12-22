<?php
namespace app\admin\controller;

use app\common\controller\Common;
use think\Controller;
use think\Session;
use think\Request;
use think\Url;
use think\Config;
use app\common\tools;


/**
* 后台基础类
* @author aierui github  https://github.com/Aierui
 *
* @version 1.0 
*/
class Admin extends Common
{
	protected $request;
	private $module_name;

	function _initialize()
	{
		parent::_initialize();
		//验证权限
		$auth = new tools\Auth();
		$request = Request::instance();
		$rule_name=$request->module().'/'.$request->controller().'/'.$request->action();
		$userRow = Session::get(Config::get('USER_AUTH_KEY'), 'admin');
		$uid = isset($userRow['id']) ? $userRow['id'] : 0;
		if(!$auth->check($rule_name, $uid)) {
			//die('无权限');
		}
		$this->request = Request::instance();
		$this->module_name = Request::instance()->module();

		if($this->module_name == "admin"){
			$this->checkAccess();
		}	
	 	//获取session
	 	$userId = Session::get(config('USER_AUTH_KEY').'.id','admin');
	 	if(is_null($userId)){
	 		$this->goLogin();
	 	}
	}


	public function checkAccess()
	{


		$uid = $this->key();

		if(is_null($uid)){
			$this->goLogin();
			return false;
		}
		
	}

	public function key()
	{
		$user = Session::get(config('USER_AUTH_KEY'),'admin');
		if(is_null($user)){
			$this->goLogin();
		}
		if(empty($user)){
			$this->goLogin();
		}
		$user = reset($user);
		return $user;
	}

	public function goLogin()
	{
		Session::clear();
		$redirect = '/admin/login/'; 
		$this->redirect(Url::build($redirect));
	}
}

