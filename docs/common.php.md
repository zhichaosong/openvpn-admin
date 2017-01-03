# common.php
在application中有两种这个文件


##  应用公共文件
这里定义了许多系统常用的函数

如调试需要使用的输出、账户密码加密等

~~~
print_data()
print_json()
md6() 嘻嘻 这里不是md5,两次使用md5，便于好记便命名之
~~~



##  模块公共文件
这里定义了许多系统中对应模块常用的函数
为了方便，我又重新定义另一个返回函数 info()
~~~
info($msg = '', $code = '', $url = '',  $data = '', $wait = 3 )
~~~


| 参数   | 类型   | 默认   | 含义   |
| --- | --- | --- | --- |
|  $msg  | string   |    |  提示信息  |
|  $code | number   | 0或1   | 0（失败） 、1（成功）  |
|  $url  |  string  |    |  跳转地址  |
|  $data  |  object  |    |    |
|  $wait  |  number  | 3s   |  连接跳转页面时间  |


