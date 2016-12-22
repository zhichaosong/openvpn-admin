<?php

return [
    //网站名称
	'WEBSITE_NAME'          		    =>  'Red-Team',
    // 默认输出类型
    'default_return_type'               => 'html',
    // 默认跳转页面对应的模板文件
    'dispatch_success_tmpl'             => APP_PATH  . 'admin/view/' .DS. 'dispatch_jump.tpl',
    'dispatch_error_tmpl'               => APP_PATH  . 'admin/view/' .DS. 'dispatch_jump.tpl',

    //异常页面模板文件
    'exception_tmpl'                    => APP_PATH . 'admin/view' .DS. 'think_exception.tpl',

    'http_exception_template'           =>  [
                                                // 定义404错误的重定向页面地址
                                                404 =>  APP_PATH. 'admin/view' .DS. '404.html',
                                                // 还可以定义其它的HTTP status
                                                401 =>  APP_PATH. 'admin/view' .DS. '401.html',
                                            ],

    // +----------------------------------------------------------------------
    // | 模块设置
    // +----------------------------------------------------------------------
    // 默认控制器名
    'default_controller'     => 'Login',
    // 默认操作名
    'default_action'         => 'index',
	
    //模板布局
	'template'                          =>  [
	    'layout_on'    =>  true,
	    'layout_name'  =>  'layout',
        // 模板后缀
        // 'view_suffix'  => 'html',
        'taglib_pre_load'    =>    'think\template\taglib\Cx,app\admin\taglib\Article',
        'taglib_build_in'    =>    'think\template\taglib\Cx,app\admin\taglib\Article',
	],
    //缓存
    'cache'                             => [
        // 驱动方式
        'type'   => 'File',
        // 缓存保存目录
        'path'   => RUNTIME_PATH.'system/adminData/',
        // 缓存前缀
        'prefix' => '',
        // 缓存有效期 0表示永久缓存
        'expire' => 0,
    ],

    // 'app_debug'              => true,

    'session'                => [
        'id'             => '',
        // SESSION_ID的提交变量,解决flash上传跨域
        'var_session_id' => '',
        // SESSION 前缀
        'prefix'         => 'red-team',
        // 驱动方式 支持redis memcache memcached
        'type'           => '',
        //过期时间 一周
        'expire'         => '604800',
        // 是否自动开启 SESSION
        'auto_start'     => true,
    ],

    // 视图输出字符串内容替换
    'view_replace_str'       => [
        '__CSS__'    => STATIC_PATH . 'admin/css',
        '__JS__'     => STATIC_PATH . 'admin/js',
        '__IMG__'    => STATIC_PATH . 'admin/images',
        '__LIB__'    => STATIC_PATH . 'admin/lib'
    ],

    //伪静态
    'url_html_suffix' => false,


    'USER_AUTH_KEY'                     =>  'authId',   // 用户认证SESSION标记
    'ADMIN_AUTH_KEY'                    =>  'administrator',
    'USER_TABLE_NAME'                   =>  'users',    // 用户表名称
    'AUTH_TABLE_MENU'                   =>  'bs_menu',    // 菜单表名称
    'AUTH_TABLE_NODE'                   =>  'bs_node',    // 权限节点表名称
    'AUTH_TABLE_ROLE'                   =>  'bs_role',    // 角色表名称
    'AUTH_TABLE_ROLE_USER'              =>  'bs_role_user',    // 角色表名称

    'USER_AUTH_TYPE'        =>  2,      // 默认认证类型0不认证； 1 登录认证； 2 实时认证
    'GUEST_AUTH_ID'         =>  0,      //游客模式
    'NOT_AUTH_MODULE'       =>  '',     // 默认无需认证模块
    'REQUIRE_AUTH_MODULE'   =>  '',     // 默认需要认证模块
    'NOT_AUTH_ACTION'       =>  '',     // 默认无需认证操作
];