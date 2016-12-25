<?php
namespace app\admin\controller;

use app\common\controller\Common;
use think\Controller;
use think\Session;
use think\Request;
use think\Url;
use app\common\tools;


/**
* 后台基础类
* @author aierui github  https://github.com/Aierui
 *
* @version 1.0 
*/
class Admin extends Common
{
	function _initialize()
	{
		parent::_initialize();
		//判断是否已经登录
		$userRow = Session::get('userinfo', 'admin');
		if( empty($userRow) ) {
			$this->error('Please login first', url('admin/Login/index'));
		}
		//验证权限
		$auth = new tools\Auth();
		$request = Request::instance();
		$rule_name=$request->module().'/'.$request->controller().'/'.$request->action();
		$uid = $userRow['id'];
		if($userRow['administrator']!=1 && !$auth->check($uid, $rule_name)) {
			$this->error(lang('Without the permissions page'));
		}
	}

	public function goLogin()
	{
		Session::clear();
		$redirect = '/admin/login/'; 
		$this->redirect(Url::build($redirect));
	}
}

