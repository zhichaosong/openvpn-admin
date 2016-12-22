<?php
namespace app\admin\controller;


/**
* 用户管理
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Dash extends Admin
{
    public function index()
    {
    	return $this->fetch();
    }
}