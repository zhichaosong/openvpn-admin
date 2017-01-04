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
* 后台controller基础类
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

		if( !Session::has('userinfo', 'admin') ) {
			$this->error('Please login first', url('admin/Login/index'));
		}
		$userRow = Session::get('userinfo', 'admin');
		//验证权限
		$request = Request::instance();
		$rule_val = $request->module().'/'.$request->controller().'/'.$request->action();
		$uid = $userRow['id'];
		if($userRow['administrator']!=1 && !$this->checkRule($uid, $rule_val)) {
			$this->error(lang('Without the permissions page'));
		}
	}

	public function goLogin()
	{
		Session::clear();
		$this->redirect( url('admin/login/') );
	}

	public function checkRule($uid, $rule_val)
	{
		$authRule = Loader::model('AuthRule');
		if(!$authRule->isCheck($rule_val)) {
			return true;
		}
		$authAccess = Loader::model('AuthAccess');
		if(in_array($rule_val, $authAccess->getRuleVals($uid))){
			return true;
		}
		return false;
	}

	//执行该动作必须验证权限，否则抛出异常
	public function mustCheckRule( $rule_val = '' )
	{
		if( empty($rule_val) ) {
			$request = Request::instance();
			$rule_val = $request->module().'/'.$request->controller().'/'.$request->action();
		}

		if(!model('AuthRule')->isCheck($rule_val)) {
			$this->error(lang('This action must be rule'));
		}
	}
}

