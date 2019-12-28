@echo off
echo 'Stop All...';
cmd /c call docker stop mysql57 mysql80 php54 php55 php56 php70 php71 php72 php73 nginx
echo 'Clear All...';
cmd /c call docker rm mysql57 mysql80 php54 php55 php56 php70 php71 php72 php73 nginx
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