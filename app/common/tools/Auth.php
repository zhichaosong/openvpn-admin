<?php
namespace app\common\tools;

use \think\Db;


/**
 * 权限验证类
 *
 * Class Auth
 * @package app\common\tools
 */
class Auth
{
    //默认配置
    protected $_config = array(
        'AUTH_GROUP' => 'ta_auth_group', //用户组数据表名
        'AUTH_GROUP_ACCESS' => 'ta_auth_group_access', //用户组明细表
        'AUTH_RULE' => 'ta_auth_rule', //权限规则表
        'AUTH_USER' => 'users'//用户信息表
    );

    /**
     * 检查权限
     *
     * @param $name 获得权限$name 可以是字符串或数组或逗号分割
     * @param $uid 认证的用户id
     * @param string $relation 是否为or关系，为true是， name为数组，只要数组中有一个条件通过则通过，如果为false需要全部条件通过
     * @return bool
     * name元素中的字符串需要对大小写保持一致，避免验证 或者添加 strtolower() 函数不区分大小写 为保证数据格式一致，建议转为小（大）写
     */
    public function check($name, $uid, $relation='or')
    {
        $authList = $this->getAuthList($uid);
        if (is_string($name)) {
            if (strpos($name, ',') !== false) {
                $name = explode(',', $name);
            } else {
                $name = array($name);
            }
        }
        $list = array(); //有权限的name
        foreach ($authList as $val) {
            if (in_array($val, $name))
                $list[] = $val;
        }
        if ($relation=='or' and !empty($list)) {
            return true;
        }
        $diff = array_diff($name, $list);
        if ($relation=='and' and empty($diff)) {
            return true;
        }
        return false;
    }

    /**
     * 获得用户组，外部也可以调用
     *
     * @param $uid
     * @return mixed
     */
    public function getGroups($uid) {
        static $groups = array();
        if (isset($groups[$uid]))
            return $groups[$uid];
        $user_groups = Db::table($this->_config['AUTH_GROUP_ACCESS'])->alias('a')->where(['a.uid'=>$uid, 'g.status'=>'1'])->join($this->_config['AUTH_GROUP'].' g', 'a.group_id=g.id')->select();
        $groups[$uid]=$user_groups?$user_groups:array();
        return $groups[$uid];
    }

    /**
     * 获得权限列表
     *
     * @param $uid
     * @return array
     */
    protected function getAuthList($uid)
    {
        static $_authList = array();
        if (isset($_authList[$uid])) {
            return $_authList[$uid];
        }
        //读取用户所属用户组
        $groups = $this->getGroups($uid);
        $ids = array();
        foreach ($groups as $g) {
            $ids = array_merge($ids, explode(',', trim($g['rules'], ',')));
        }
        $ids = array_unique($ids);
        if (empty($ids)) {
            $_authList[$uid] = array();
            return array();
        }
        //读取用户组所有权限规则
        $map=array(
            'id'=>array('in',$ids),
            'status'=>1
        );
        $rules = Db::table($this->_config['AUTH_RULE'])->where($map)->select();
        //循环规则，判断结果。
        $authList = array();
        foreach ($rules as $r) {
            if (!empty($r['condition'])) {
                //条件验证
                $user = $this->getUserInfo($uid);
                $command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $r['condition']);
                //dump($command);//debug
                @(eval('$condition=(' . $command . ');'));
                if ($condition) {
                    $authList[] = $r['name'];
                }
            } else {
                //存在就通过
                $authList[] = $r['name'];
            }
        }
        $_authList[$uid] = $authList;
        return $authList;
    }

    /**
     * 获得用户资料,根据自己的情况读取数据库
     *
     * @param $uid
     * @return mixed
     */
    protected function getUserInfo($uid)
    {
        static $userinfo=array();
        if(!isset($userinfo[$uid])){
             $userinfo[$uid]= Db::table($this->_config['AUTH_USER'])->find($uid);
        }
        return $userinfo[$uid];
    }

}
