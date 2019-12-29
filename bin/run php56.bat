@echo off
echo 'Start php56...';
cmd /c call docker stop php54 php55 php70 php71 php72 php73
cmd /c call docker restart php56 mysql57 nginx
echo 'Finished...';
