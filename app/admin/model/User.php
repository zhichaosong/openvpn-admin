<?php
namespace app\admin\model;

use think\Db;
use think\Loader;
use think\Model;

class User extends Model
{
	//protected $table = 'ta_users';
	/**
	 *  用户登录
	 */

	public function login(array $data)
	{
		$code = 1;
		$msg = '';
		//！！！ 用户名、密码、验证码，需要统一后台验证，使用 validate
		$check_field = ['username', 'password'];
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
			'username'=>$data['username']
		];
		$userRow = Db::name('users')->where($map)->find();
		if( empty($userRow) ) {
			return info(lang('Login failed'), 5001);
		}
		$md_password = mduser( $data['password'] );
		if( $userRow['password'] != $md_password ) {
			return info(lang('Login failed'), 5001);
		}
		return info(lang('Login succeed'), $code, '', $userRow);

		/*$exist = Db::table('bs_role_user')->where('user_id',$userRow['id'])->find();
		if( empty($userRow) || $userRow['status'] == 0 || $userRow['password'] != $password || ($userRow['administrator'] == 0 && empty($exist)) ){
			if(empty($userRow)){
				$this->error = '该手机号未注册！';
			}elseif($userRow['status'] == 0){
				$this->error = '该用户已被禁用，请联系管理员！';
			}elseif($userRow['password'] != $password){
				$this->error = '密码错误！';
			}elseif ($userRow['administrator'] == 0 && empty($exist)) {
				$this->error = '该账号未授权，请联系超级管理。';
			}
			//登录失败要记录在日志里
	    	Loader::model('LogRecord')->record("登录失败, [username_mobile: {$data['mobile']}],[ status: {$this->error} ],[password: " .replaceToStar($password) . ']');
	    	return false;
		}

        unset($userRow['password']);

        //登录成功要记录在日志里
        Loader::model('LogRecord')->record('登录成功');
		return $userRow;	*/
	}

	public function index($data = null)
	{
		$join = [['bs_role_user access','u.id = access.user_id','LEFT '],
				 ['bs_role role','access.role_id = role.id','LEFT']
				];
		$data = Db::name('users')
					->alias('u')
					->field('u.id,u.username,u.mobile,u.status,u.create_time,
						GROUP_CONCAT(role.`name`) AS role_name')
					->join($join)
					->group('u.id')
					->order('id desc')
					->select();

		foreach ($data as $key => $value) {
			$data[$key]['create_time'] = date('Y-m-d H:i:s',$value['create_time']);
		}
		return $data;
	}


	public function add(array $data = [])
	{
		if($data['password2'] != $data['password']){
            return info('两次密码不一致！',0);
        }
		unset($data['password2']);
		$data['password'] = mduser($data['password']);
		$data['createtime'] = time();
		$data['updatetime'] = time();
		//$id = Db::name('users')->insertGetId($data);
		//if($id > 0){
			//Loader::model('LogRecord')->record('账号管理-添加成功');
            return info('添加成功！',1);
        //}else{
        	//Loader::model('LogRecord')->record('账号管理-添加失败 data='.serialize($data));
        //    return info('添加失败！',0);
        //}
	}

	public function edit(array $data = [])
	{
		if($data['password2'] != $data['password']){
            return info('两次密码不一致！',0);
        }
		$data['password'] = md6($data['password']);
		$user = new User; 
		$res = $user->allowField(true)->save($data,['id'=>$data['id']]);
		if($res == 1){
			Loader::model('LogRecord')->record('账号管理-编辑成功');
            return info('编辑成功！',1);
        }else{
        	Loader::model('LogRecord')->record('账号管理-编辑失败 data='.serialize($data));
            return info('编辑失败！',0);
        }
	}


}
