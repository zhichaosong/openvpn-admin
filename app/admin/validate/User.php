<?php
namespace app\admin\validate;

use think\Validate;

class User extends Validate
{

    protected $rule =   [
        'mobile'              => 'require|length:11',
        'password'              => 'length:6,16',
    ];

    protected $message  =   [
        'mobile.require'      => '账号必须',
        'mobile.length'       => '请输入正确手机号',
        'password.length'       => '密码应在6-20之间',
    ];

    protected $scene = [
        'login'                 =>  ['mobile','password'],
    ];

}


