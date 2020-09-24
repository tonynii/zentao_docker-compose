# 禅道部署之Docker-compose
禅道官网是有提供docker部署镜像的，但这个镜像是套包，没有将数据库分开部署，这里提供docker-compose方式部署，将数据库和php分成了两个容器，同时增加了adminer容器可以非常方便的访问和管理数据库。

## 使用方法
1. 克隆项目到本地
2. 在终端上切换目录到此项目目录中
3. 运行docker-compose build
4. 运行docker-compose up
5. 在浏览器中打开127.0.0.1:2048，会进入禅道的install页面。
6. 点击下一步进入配置文件设置界面，输入如下图
![config](jpg/config.png)
7. 点击保存之后根据页面提示输入相关信息即可使用

## 其他
- 如遇到问题，欢迎给本项目提交issue
- 数据库管理可登录127.0.0.1:8080, 登录界面如下
![db_login](jpg/db_login.png)
- 关于数据迁移。可以在adminer页面导入原来数据库的数据。如果打开禅道主页跳转到upgrade.php页面，需要上传upgrade.php文件到www文件夹下，重载页面后按照提示操作即可。
