<?php
namespace app\admin\model;

use think\Config;
use think\Db;
use think\Loader;
use think\Model;
use traits\model\SoftDelete;


class User extends Model
{
	use SoftDelete;
    protected $deleteTime = 'delete_time';

	/**
	 *  用户登录
	 */
	public function login(array $data)
	{
		$code = 1;
		$msg = '';
		//！！！ 用户名、密码、验证码，需要统一后台验证，使用 validate
		$check_field = ['mobile', 'password'];
		foreach($check_field as $field) {
			if(!isset($data[$field])) {
				$code = 4001;
				$msg = lang('Input error');
				break;
			}
		}
		if( $code != 1 ) {
			return info($msg, $code);
		}
		$map = [
			'mobile' => $data['mobile']
		];
		$userRow = $this->where($map)->find();
		if( empty($userRow) ) {
			return info(lang('You entered the account or password is incorrect, please again'), 5001);
		}
		$md_password = mduser( $data['password'] );
		if( $userRow['password'] != $md_password ) {
			return info(lang('You entered the account or password is incorrect, please again'), 5001);
		}
		return info(lang('Login succeed'), $code, '', $userRow);
	}


	public function index($data = null)
	{
		$data = User::all(function($query){
				    $query->alias('u')->field('u.id,u.username,u.mobile,u.status,u.create_time')->order('create_time', 'desc');
				});
		foreach ($data as $key => $value) {
			$data[$key]['create_time'] = date('Y-m-d H:i:s',$value['create_time']);
			$data[$key]['status'] = $value['status'] == 1 ? '启用' : '禁用';
		}
		return $data;
	}


	public function add(array $data = [])
	{	
		$user = User::get(['mobile' => $data['mobile']]);
		if (!empty($user)) {
			return info(lang('Moblie already exists'), 0);
		}
		if($data['password2'] != $data['password']){
            return info(lang('The password is not the same twice'), 0);
        }
		unset($data['password2']);
		$data['password'] = mduser($data['password']);
		$data['create_time'] = time();
		$data['update_time'] = time();
		$id = $this->insertGetId($data);
		if($id > 0){
            return info(lang('Add succeed'), 1);
        }else{
            return info(lang('Add failed') ,0);
        }
	}

	public function edit(array $data = [])
	{
		if($data['password2'] != $data['password']){
            return info('两次密码不一致！',0);
        }
		$data['password'] = mduser($data['password']);
		$res = $this->allowField(true)->save($data,['id'=>$data['id']]);
		if($res == 1){
            return info(lang('Edit succeed'), 1);
        }else{
            return info(lang('Edit failed'), 0);
        }
	}

	public function finduserById($id)
	{
		return User::get($id);
	}

	public function deleteById($id)
	{
		$result = User::destroy($id);
		if ($result > 0) {
            return info(lang('Delete succeed'), 1);
        }   
	}


}
