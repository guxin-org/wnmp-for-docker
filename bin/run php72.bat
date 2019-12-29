@echo off
echo 'Start php72...';
cmd /c call docker stop php54 php55 php56 php71 php73
cmd /c call docker restart php72 mysql57 nginx
echo 'Finished...';
