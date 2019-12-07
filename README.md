# docker 配置 WNMP 开发环境

>为了更快速方便使用docker搭建WNMP的环境部署，故将部署相关命令整理成相关批处理脚本。留着以后备用，同时请大佬指出其中不足，万分感谢！

#### 相关介绍
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;环境包含
- nginx
- mysql5.7
- mysql8.0.18
- php-5.4-fpm
- php-5.5-fpm
- php-5.6-fpm
- php-7.0-fpm
- php-7.1-fpm
- php-7.2-fpm
- php-7.2-fpm

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;windows用户在安装docker环境后可在一个新的文件夹下直接运行 <kbd>init dnmp.bat</kbd> 脚本，运行后会创建以上相关容器。在当前目录下会创建容器映射后的配置以及日志文件，可以通过修改相关配置文件满足你的需求（修改配置后记得重启容器）。相关项目文件存放在www目录中。

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;安装之前请先查看你本机3306，3307，9000，80端口是否被占用。若被占用请进行停用，或可以修改 <kbd>init dnmp.bat</kbd> 脚本中的docker映射的端口。

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;MySQL有两个版本，5.7和8.0，分别占用本机的3306和3307端口，初始密码为root。请更具自己需求修改。

&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;运行 <kbd>start phpXX.bat</kbd> 可切换值相关php版本环境。

#### 安装流程
1. 运行 <kbd>init dnmp.bat</kbd> 脚本
2. 修改nginx配置 修改 <kbd>你的路径</kbd>\nginx-conf\conf.d\default.conf

```default.conf
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /var/www/html;                       #修改为php映射的项目路径
        index  index.php index.html index.htm;      #增加运行php脚本
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        root           /var/www/html;           #修改为php映射的项目路径
        fastcgi_pass   172.18.0.4:9000;         #此处php几个版本的固定ip
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;   #修改脚本的运行方式
        include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
```
    
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;修改保存后运行命令 docker restart nginx 重启nginx容器。

#### 清除
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;清除环境之前请切记将 www 目录下你的项目备份出来（没有的话则不用管），然后运行 <kbd>clear dnmp.bat</kbd> 脚本。执行后会删除相关容器及文件。

#### 容器IP
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;为方便php版本切换，故将docker容器的IP固定。当然可以根据自己的实际需求修改容器IP（修改 <kbd>init dnmp.bat</kbd> 脚本）。
- 172.18.0.2    mysql 5.7
- 172.18.0.3    mysql 8.0.18
- 172.18.0.4    php
- 172.18.0.5    nginx

#### 常用的docker命令
```
docker images                       ##查看所有镜像
docker ps                           ##查看运行中容器
docker ps -a                        ##查看所有容器
docker inspect XXXX                 ##查看容器信息(ip)
docker exec -it XXXX /bin/bash      ##进入容器