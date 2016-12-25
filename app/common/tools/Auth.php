<?php
namespace app\common\tools;

use app\admin\model\User;
use \think\Db;
use think\Model;


/**
 * 权限验证类
 *
 * Class Auth
 * @package app\common\tools
 */
class Auth
{
    /**
     * 检查权限
     *
     * @param $name 获得权限$name 可以是字符串或数组或逗号分割
     * @param $uid 认证的用户id
     * @param string $relation 是否为or关系，为true是， name为数组，只要数组中有一个条件通过则通过，如果为false需要全部条件通过
     * @return bool
     * name元素中的字符串需要对大小写保持一致，避免验证 或者添加 strtolower() 函数不区分大小写 为保证数据格式一致，建议转为小（大）写
     */
    public function check($uid, $name)
    {
        $authList = $this->getAuthList($uid);
        if (in_array($name, $authList)) {
            return true;
        }
        return false;
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
        //获取所属角色的权限列表
        $roles = $this->getRoles($uid);
        $ids = array();
        foreach ($roles as $g) {
            $ids = array_merge($ids, explode(',', trim($g['rule_name'], ',')));
        }
        $ids = array_unique($ids);
        if (empty($ids)) {
            $_authList[$uid] = array();
        } else {
            $_authList[$uid] = $ids;
        }
        return $_authList[$uid];
    }

    /**
     * 获得用户组，外部也可以调用
     *
     * @param $uid
     * @return mixed
     */
    public function getRoles($uid) {
        static $groups = array();
        if (isset($groups[$uid]))
            return $groups[$uid];
        $user_groups = Db::name('role_user')->alias('a')->where(['a.user_id'=>$uid])->join('auth_access g', 'a.role_id=g.role_id')->select();
        $groups[$uid]=$user_groups?$user_groups:array();
        return $groups[$uid];
    }
}
