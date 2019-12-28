@echo off
echo 'Start php55...';
cmd /c call docker stop php54 php56 php70 php71 php72 php73
cmd /c call docker restart php55 mysql57 nginx
echo 'Finished...';
