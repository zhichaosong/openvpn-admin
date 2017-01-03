<?php
namespace app\admin\model;

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
    				->field('id,username,email,content,create_time')
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

	public function add(array $data = [])
	{	
		$row = Comment::get(['email' => $data['email']]);
		if (!empty($row)) {
			return info(lang('e-mail already exists'), 0);
		}
		$data['create_time'] = time();
		$this->allowField(true)->save($data);
		if($this->id > 0){
            return info(lang('Add succeed'), 1);
        }else{
            return info(lang('Add failed') ,0);
        }
	}

	public function edit(array $data = [])
	{
		$row = Comment::get(['email' => $data['email']]);
		if (!empty($row)) {
			return info(lang('e-mail already exists'), 0);
		}
		
		$data['update_time'] = time();

		$res = $this->allowField(true)->save($data,['id'=>$data['id']]);
		if($res == 1){
            return info(lang('Edit succeed'), 1);
        }else{
            return info(lang('Edit failed'), 0);
        }
	}

	public function deleteById($id)
	{
		$result = Comment::destroy($id);
		if ($result > 0) {
            return info(lang('Delete succeed'), 1);
        }   
	}


}