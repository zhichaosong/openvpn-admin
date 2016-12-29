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
        'mobile.require'      => 'Mobile require',
        'mobile.length'       => 'Please enter a correct mobile',
        'password.length'       => 'Please enter a correct password',
    ];

    protected $scene = [
        'add' => ['mobile','password'],
        'login' =>  ['mobile','password'],
    ];

}


