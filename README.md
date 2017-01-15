> 新版本在线体验地址已经上线，欢迎体验👏 ---2017-01-14

> 喜欢就Star，不只是Fork；

> 想要分享的动机才是驱动力，而技术仅仅是一种方法。


======================

# TP-admin

TP-admin即基于ThinkPHP5拿来即用高性能后台管理系统


## 官方文档
地址：[http://doc.tpadmin.shijinrong.cn/](http://doc.tpadmin.shijinrong.cn/)

## 在线体验

地址：[http://tpadmin.shijinrong.cn/admin/](http://tpadmin.shijinrong.cn/admin/login)

账户：13330613321

密码：123456


## 线上仓库

在线地址：[https://github.com/Astonep/tp-admin](https://github.com/Astonep/tp-admin)

### 源代码下载

**git克隆**：``git clone https://github.com/Astonep/tp-admin`` 

**直接下载**：[https://github.com/Astonep/tp-admin/archive/master.zip](https://github.com/Astonep/tp-admin/archive/master.zip) 

## 本地部署

**运行环境要求**

> * PHP >= 5.4.0
> * PDO PHP Extension
> * MBstring PHP Extension
> * CURL PHP Extension

建议配置虚拟域名（若不清楚，请自行解决之），方便接下来开展你的开发工作。
> 按照TP5默认，入口文件位于`public/index.php`
> 入口文件位置的设计是为了让应用部署更安全，public目录为web可访问目录，其他的文件都可以放到非WEB访问目录下面。


除非
> 你是一名高级PHPer，也可以为每一个模块自定义入口文件


**部署完成后**

~~~
http://your-domain/ 例如虚拟域名配置为www.web.com 则http://www.web.com
~~~


**详细参考**[ThinkPHP5官方手册中的部署部分](http://www.kancloud.cn/manual/thinkphp5/129745)官方手册更加完善且很清楚

## 开发规范
tp-admin框架严格遵循ThinkPHP5开发规范，详情请参照[官方手册](http://www.kancloud.cn/manual/thinkphp5/118007)


# TP－Admin——拿来即用高性能后台管理系统

TP-Admin即基于ThinkPHP5的web后台管理系统（总结一套自己的后台管理系统，方便自己后续的项目开发。）
## 主要特性：
- **自适应手机端**：响应式布局，PC、移动端效果均表现不错
- **支持国际化**：已实现功能完全支持国际化，在给出的模式下开发，可以完全符合国际化需求
- **使用ThinkPHP5.0+**
- **吸取教训**：吸取 OneThink + ThinkCMF 的开源框架优点（如：静态资源部署，角色权限管理）；
- **部署**：支持单域名（如：www.shijinrong.cn/admin、www.shijinrong.cn）单域名部署（如：admin.shijinrong.cn、www.shijinrong.cn）；
- **日志记录**：自动记录网站操作写入数据库
- **数据验证**：表单数据自动验证（包含前台Js + 后台使用ThinkPHP5内置validate类）
- **基础封装**：后台基础类，如权限验证、登录等
- **账号管理**：平台后台账号统一管理，自定义分配角色
- **异步请求**：减轻服务器端的压力，避免阻塞，提高效率，保护好全局污染


## 支持TP-admin的用户请到 [GitHub](https://github.com/Astonep/tp-admin) 给我们一个star ^_^


### 为什么要选择TP5
因为TP5在框架中就有如下高级特性
* * * * *

- **规范**：遵循PSR-2、PSR-4规范，Composer及单元测试支持；
- **严谨**：异常严谨的错误检测和安全机制，详细的日志信息，为你的开发保驾护航；
- **灵活**：减少核心依赖，扩展更灵活、方便，支持命令行指令扩展；
- **API友好**：出色的性能和REST支持、远程调试，更好的支持API开发；
- **高效**：惰性加载，及路由、配置和自动加载的缓存机制；
- **ORM**：重构的数据库、模型及关联，MongoDb支持；

### 合理使用轮子
排名部分先后顺序
- 框架：ThinkPHP5.0.2、jQuery3.1.0
- 插件：bootstrap3.3.0、bootstrap-table1.11.0、validate.js0.10.0、pace1.0.0、metismenu2.0.2、font-awesome4.6.3
- 平台：Github
- ……

> 在此非常感谢各框架、插件、平台的支持





## 交流
- 问题只接受来自[Github上Issues](https://github.com/Astonep/tp-admin/issues)《源码附截图，并描述清楚
- 欢迎提出bug、便于我接下来修改
- 若你还有足够的精力和时间，欢迎你也加入进来
- 邮箱：imland@outlook.com
- 微信：imland
