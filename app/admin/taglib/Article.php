<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace app\admin\taglib;

use think\template\TagLib;
use think\Request;

/**
 * 文章标签类
 * Class Article
 * @package app\admin\taglib
 *
 * @author php_er@126.com
 */
class Article extends Taglib
{

    // 标签定义
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'read'        => ['attr' => 'id']
    ];

    /**
     * 读出文章标签 demo
     * 格式：
     * {read}xxxxxx{/read}
     * @access public
     * @param array $tag 标签属性
     * @param string $content 标签内容
     * @return string
     */
    public function tagRead($tag, $content)
    {
        $id = $tag['id'];
        $parseStr = $id . $content.'test test';
        return $parseStr;
    }
}
