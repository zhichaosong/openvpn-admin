<?php
namespace app\admin\model;

use think\Config;
use think\Db;
use think\Loader;
use think\Model;

class Role extends Model
{
    //根据uid返回角色 rule_val
    public function getRoleInfo( $uid )
    {

    }

    public function getKvData()
    {
        return $this->where('status',1)->column('name','id');
    }
}
