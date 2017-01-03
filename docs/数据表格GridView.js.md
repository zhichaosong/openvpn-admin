
## 数据表格显示优化[GridView](https://github.com/Aierui/web/blob/master/public/js/admin/gridview.js)

为了便于组件化开发，我将后台的模态框添加、编辑数据、数据删除等进行封装。对于添加、编辑只需要一个模板页面文件即可。

例如，
###以用户留言为例

#### 后台逻辑代码
~~~

	/**
	 * 添加
	 */
	public function add()
	{
		if (request()->isPost()) {
			$data = request()->param();
			$data['create_time'] = time();
			$res = $this->comment->insert($data);
			if ($res == 1) {
				return info("添加成功!",1);
			}else{
				return info("添加失败!",0);
			}
		}		
		return $this->fetch('edit');
	}


	/**
	 * 编辑
	 */
	public function edit($id = 0)
	{
		if(intval($id) < 0){
			return info("数据ID异常",0);
			exit;
		}
		if (request()->isPost()) {
			$data = request()->param();
			$res = $this->comment->update($data);
			if ($res == 1) {
				return info("编辑成功!",1);
			}else{
				return info("编辑失败!",0);
			}
		}		
		$data = $this->comment->where('id',$id)->find();
		$this->assign('data',$data);
		return $this->fetch();
	}


~~~
#### 模板页面

~~~
{__NOLAYOUT__}
<form data-method="post" data-action="/{$Request.module}/{$Request.controller}/{$Request.action}" data-submit="ajax" data-validate="true" class="form-horizontal">
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title">{$data['id']?'修改':'添加'}留言</h3>
                </div>
                <input type="hidden" name="id" value="{$data.id ?? ''}">
                <div class="modal-body">
                    <div class="modal-body-content">
                        <div class="form-group must">
                            <label class="col-sm-3 control-label">称呼</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" maxlength="8" placeholder="至多8个字符" required value="{$data.name ?? ''}">
                            </div>
                        </div>
                        <div class="form-group must">
                            <label class="col-sm-3 control-label">内容</label>
                            <div class="col-sm-7">
                                <textarea class="form-control required" name="content" maxlength="150" rows="3">{$data['content'] ?? ''}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
</form>
~~~
  
> 小伙伴们，有没有觉得很简洁、优美呢？没有任何脚本

> 是因为我在系统都做了基础封装，想了解更多，欢迎骚扰。
