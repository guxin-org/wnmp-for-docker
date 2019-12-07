@echo off
echo 'Stop All...';
cmd /c call docker stop mysql57
cmd /c call docker stop mysql80
cmd /c call docker stop php54
cmd /c call docker stop php55
cmd /c call docker stop php56
cmd /c call docker stop php70
cmd /c call docker stop php71
cmd /c call docker stop php72
cmd /c call docker stop php73
cmd /c call docker stop nginx
echo 'Clear All...';
cmd /c call docker rm mysql57
cmd /c call docker rm mysql80
cmd /c call docker rm php54
cmd /c call docker rm php55
cmd /c call docker rm php56
cmd /c call docker rm php70
cmd /c call docker rm php71
cmd /c call docker rm php72
cmd /c call docker rm php73 
cmd /c call docker rm nginx
echo 'Clear Files';
rd /s /q %~dp0mysql-5.7-log
rd /s /q %~dp0mysql-8.0-log
rd /s /q %~dp0php-5.4-conf
rd /s /q %~dp0php-5.5-conf
rd /s /q %~dp0php-5.6-conf
rd /s /q %~dp0php-7.0-conf
rd /s /q %~dp0php-7.1-conf
rd /s /q %~dp0php-7.2-conf
rd /s /q %~dp0php-7.3-conf
rd /s /q %~dp0php-5.4-log
rd /s /q %~dp0php-5.5-log
rd /s /q %~dp0php-5.6-log
rd /s /q %~dp0php-7.0-log
rd /s /q %~dp0php-7.1-log
rd /s /q %~dp0php-7.2-log
rd /s /q %~dp0php-7.3-log
rd /s /q %~dp0nginx-conf
rd /s /q %~dp0nginx-log
rd /s /q %~dp0www
echo 'Finished...';
pause