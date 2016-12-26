<?php
namespace app\admin\controller;

use app\common\controller\Common;
use think\Controller;
use think\Loader;
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
		$request = Request::instance();
		$rule_val = $request->module().'/'.$request->controller().'/'.$request->action();
		$uid = $userRow['id'];
		//$userRow['administrator']!=1 &&
		if(!$this->check($uid, $rule_val)) {
			$this->error(lang('Without the permissions page'));
		}
	}

	public function goLogin()
	{
		Session::clear();
		$redirect = '/admin/login/'; 
		$this->redirect(Url::build($redirect));
	}

	public function check($uid, $rule_val)
	{
		$authRule = Loader::model('AuthRule');
		if(!$authRule->is_check($rule_val)) {
			return true;
		}
		$authAccess = Loader::model('AuthAccess');
		if(in_array($rule_val, $authAccess->getRuleVals($uid))){
			return true;
		}
		return false;
	}
}

