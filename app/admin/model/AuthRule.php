<?php
namespace app\admin\model;

use \think\Config;
use \think\Model;
use \think\Session;


/**
 * 权限规则
 *
 * @author chengbin
 */
class AuthRule extends Model
{
    public function getList($request)
    {
        return $this->where($request)->select();
    }

    public function getStatusAttr($value)
    {
        $status = self::getAllStatus();
        return $status[$value];
    }

    static function getAllStatus()
    {
        $status = [0=>'禁用',1=>'正常'];
        return $status;
    }

    public function saveData($data)
    {
        if(isset($data['rule_val'])) {
            $data['rule_val'] = strtolower($data['rule_val']);
        }
        if(isset($data['id'])) {
            $this->allowField(true)->save($data, ['id' => $data['id']]);
        } else {
            $this->insert($data);
        }
    }

    //是否需要检查节点，如果不存在权限节点数据，则不需要检查
    public function is_check( $rule_val )
    {
        $rule_val = strtolower($rule_val);
        $map = ['rule_val'=>$rule_val, 'status'=>1];
        if($this->where($map)->count()){
            return true;
        }
        return false;
    }
}