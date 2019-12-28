@echo off
echo 'Start php71...';
cmd /c call docker stop php54 php55 php56 php70 php72 php73
cmd /c call docker restart php71 mysql57 nginx
echo 'Finished...';
