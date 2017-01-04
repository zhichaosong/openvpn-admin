<?php
namespace app\admin\model;

use \think\Config;
use \think\Model;
use \think\Session;


/**
 * 角色权限
 *
 * @author chengbin
 */
class AuthAccess extends Admin
{
    static $authAccessData = array();
    public function getRuleVals( $uid )
    {
        if(!empty($auth_access)) {
            return $auth_access;
        }
        $role_id = model('RoleUser')->where(['user_id'=>$uid])->value('role_id');
        $auth_access_data = model('AuthAccess')->where(['role_id'=>$role_id])->select();
        $tmp = [];
        foreach($auth_access_data as $item) {
            $tmp[] = $item['rule_val'];
        }
        self::$authAccessData = $tmp;
        unset($tmp);
        return self::$authAccessData;
    }
}
