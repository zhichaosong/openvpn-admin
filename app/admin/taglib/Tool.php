<?php
namespace app\admin\taglib;

use think\template\TagLib;
use think\Request;

/**
* 工具类标签
*/

class Tool extends Taglib
{

    // 标签定义
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'toolbar'        => ['attr' => 'id']
    ];

    public function tagToolbar($tag, $content)
    {
       // 元素默认id
        if(empty($tag['id'])){
            $tag['id'] = 'toolbar';
        }

        $request = Request::instance();
        $module = $request->module();
        $controller = $request->controller();
        $url = '/'.$module.'/'.$controller;

        $html = '';

        $html .= '<div id="' . $tag['id'] . '" class="toolbar" data-module="'.$url.'">';
        $toolbar_node_list = \app\common\controller\Permission::getCurrentAccessList();

        
        return $html;
    }
}
