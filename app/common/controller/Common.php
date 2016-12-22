<?php
namespace app\common\controller;


use think\Controller;

/**
* 公用的控制器，pc、app、微信各端不需要控制权限的控制器，必须继承该控制器
 *
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Common extends Controller
{
    public function _initialize()
    {

    }
}