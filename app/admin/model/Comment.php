<?php
namespace app\admin\model;

use think\Config;
use think\Db;
use think\Loader;
use think\Model;
use traits\model\SoftDelete;

class Comment extends Model
{
	use SoftDelete;
    protected $deleteTime = 'delete_time';


    //列表显示

    public function index($offset, $limit, $page = true)
    {
    	$data = $this
    				->field('username,email,content,create_time')
    				->limit($offset, $limit)
    				->order('create_time', 'desc')
    				->select();
    	foreach ($data as $key => $value) {
    		$data[$key]['create_time'] = date('Y-m-d H:i:s', $value['create_time']);
    	}
    	if ($page) {
	    	$total = $this->limit($offset, $limit)->count();
    		return ['rows' => $data, 'total' => $total];
		}else{
			return $data;
		}

    }

}