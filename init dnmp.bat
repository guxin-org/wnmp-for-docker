@echo off
echo 'Start creating folders in the current files...';
md %~dp0mysql-5.7-log
md %~dp0mysql-8.0-log
md %~dp0php-5.4-conf
md %~dp0php-5.5-conf
md %~dp0php-5.6-conf
md %~dp0php-7.0-conf
md %~dp0php-7.1-conf
md %~dp0php-7.2-conf
md %~dp0php-7.3-conf
md %~dp0php-5.4-log
md %~dp0php-5.5-log
md %~dp0php-5.6-log
md %~dp0php-7.0-log
md %~dp0php-7.1-log
md %~dp0php-7.2-log
md %~dp0php-7.3-log
md %~dp0nginx-conf
md %~dp0nginx-log
md %~dp0www
echo 'init Network Self IP...';
docker network create --subnet=172.18.0.0/16 staticnet
echo 'Start initializing the container...';
cmd /c call docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql57 mysql:5.7
cmd /c call docker cp mysql57:/var/log/mysql/. %~dp0mysql-5.7-log
cmd /c call docker stop mysql57
cmd /c call docker rm mysql57
cmd /c call docker run -d -v %~dp0mysql-5.7-log:/var/log/mysql/ -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --net staticnet --ip 172.18.0.2 --name mysql57 mysql:5.7
cmd /c call docker run -d -v %~dp0mysql-8.0-log:/var/log/mysql/ -p 3307:3306 -e MYSQL_ROOT_PASSWORD=root --net staticnet --ip 172.18.0.3 --name mysql80 mysql:8.0.18
cmd /c call docker run -d -p 9000:9000 --name php54 php:5.4-fpm
cmd /c call docker run -d -p 9001:9000 --name php55 php:5.5-fpm
cmd /c call docker run -d -p 9002:9000 --name php56 php:5.6-fpm
cmd /c call docker run -d -p 9003:9000 --name php70 php:7.0-fpm
cmd /c call docker run -d -p 9004:9000 --name php71 php:7.1-fpm
cmd /c call docker run -d -p 9005:9000 --name php72 php:7.2-fpm
cmd /c call docker run -d -p 9006:9000 --name php73 php:7.3-fpm
cmd /c call docker cp php54:/usr/local/etc/. %~dp0php-5.4-conf
cmd /c call docker cp php55:/usr/local/etc/. %~dp0php-5.5-conf
cmd /c call docker cp php56:/usr/local/etc/. %~dp0php-5.6-conf
cmd /c call docker cp php70:/usr/local/etc/. %~dp0php-7.0-conf
cmd /c call docker cp php71:/usr/local/etc/. %~dp0php-7.1-conf
cmd /c call docker cp php72:/usr/local/etc/. %~dp0php-7.2-conf
cmd /c call docker cp php73:/usr/local/etc/. %~dp0php-7.3-conf
cmd /c call docker stop php54
cmd /c call docker stop php55
cmd /c call docker stop php56
cmd /c call docker stop php70
cmd /c call docker stop php71
cmd /c call docker stop php72
cmd /c call docker stop php73
cmd /c call docker rm php54
cmd /c call docker rm php55
cmd /c call docker rm php56
cmd /c call docker rm php70
cmd /c call docker rm php71
cmd /c call docker rm php72
cmd /c call docker rm php73 
cmd /c call docker run -d -v %~dp0php-5.4-conf:/usr/local/etc -v %~dp0php-5.4-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php54 php:5.4-fpm
cmd /c call docker stop php54
cmd /c call docker run -d -v %~dp0php-5.5-conf:/usr/local/etc -v %~dp0php-5.5-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php55 php:5.5-fpm
cmd /c call docker stop php55
cmd /c call docker run -d -v %~dp0php-5.6-conf:/usr/local/etc -v %~dp0php-5.6-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php56 php:5.6-fpm
cmd /c call docker stop php56
cmd /c call docker run -d -v %~dp0php-7.0-conf:/usr/local/etc -v %~dp0php-7.0-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php70 php:7.0-fpm
cmd /c call docker stop php70
cmd /c call docker run -d -v %~dp0php-7.1-conf:/usr/local/etc -v %~dp0php-7.1-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php71 php:7.1-fpm
cmd /c call docker stop php71
cmd /c call docker run -d -v %~dp0php-7.2-conf:/usr/local/etc -v %~dp0php-7.2-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php72 php:7.2-fpm
cmd /c call docker stop php72
cmd /c call docker run -d -v %~dp0php-7.3-conf:/usr/local/etc -v %~dp0php-7.3-log:/usr/local/var/log -v %~dp0www:/var/www/html -p 9000:9000 --net staticnet --ip 172.18.0.4 --name php73 php:7.3-fpm
cmd /c call docker run -d -p 80:80 --name nginx nginx:latest
cmd /c call docker cp nginx:/etc/nginx/conf.d %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/fastcgi_params %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/koi-utf %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/koi-win %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/mime.types %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/nginx.conf %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/scgi_params %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/uwsgi_params %~dp0nginx-conf
cmd /c call docker cp nginx:/etc/nginx/win-utf %~dp0nginx-conf
cmd /c call docker stop nginx
cmd /c call docker rm nginx
cmd /c call docker run -d -p 80:80 -v %~dp0www:/var/www/html -v %~dp0nginx-conf:/etc/nginx/ -v %~dp0nginx-log:/var/log/nginx/ --net staticnet --ip 172.18.0.5 --name nginx nginx:latest
echo 'Finished...';
pause

