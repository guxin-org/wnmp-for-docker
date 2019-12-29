@echo off
echo 'Stop All...';
cmd /c call docker stop mysql57 mysql80 php54 php55 php56 php70 php71 php72 php73 nginx
echo 'Clear All...';
cmd /c call docker rm mysql57 mysql80 php54 php55 php56 php70 php71 php72 php73 nginx
echo 'Clear Network...';
cmd /c call docker network rm static_ip
echo 'Clear Files';
rd /q /s  %~dp0..\config\
rd /q /s  %~dp0..\log\
md %~dp0..\config\
md %~dp0..\log\
md %~dp0..\config\nginx-conf\
md %~dp0..\config\php-5.4-conf\
md %~dp0..\config\php-5.5-conf\
md %~dp0..\config\php-5.6-conf\
md %~dp0..\config\php-7.0-conf\
md %~dp0..\config\php-7.1-conf\
md %~dp0..\config\php-7.2-conf\
md %~dp0..\config\php-7.3-conf\
md %~dp0..\log\mysql-5.7-log\
md %~dp0..\log\mysql-8.0-log\
md %~dp0..\log\php-5.4-log\
md %~dp0..\log\php-5.5-log\
md %~dp0..\log\php-5.6-log\
md %~dp0..\log\php-7.0-log\
md %~dp0..\log\php-7.1-log\
md %~dp0..\log\php-7.2-log\
md %~dp0..\log\php-7.3-log\
md %~dp0..\log\nginx-log\
echo 'Finished...';
pause