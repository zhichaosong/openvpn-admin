<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;


/**
* 用户管理
* @author aierui github  https://github.com/Aierui
* @version 1.0 
*/
class Dash extends AdminBase
{
    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
    	return $this->fetch();
    }
 

}
?>

