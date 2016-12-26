<?php
namespace app\admin\controller;

use think\Controller;
use think\Loader;

/**
* 登录
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Authrule extends Admin
{
	private $authRule;

	public function _initialize()
	{
		parent::_initialize();
		$this->authRule = Loader::model('AuthRule');
	}
	/**
	 * 规则列表
	 *
	 * @author chengbin
	 */
	public function index()
	{
		return view();
	}

	/**
	 * 添加规则
	 *
	 * @author chengbin
	 */
	public function add()
	{
		$this->assign('allstatus', \app\admin\model\AuthRule::getAllStatus());
		return view();
	}

	public function saveData()
	{
		$data = input('post.');
		$this->authRule->saveData($data);
		$this->success(lang('Save success'));
	}
}