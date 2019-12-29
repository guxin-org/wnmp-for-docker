@echo off
echo 'Start php73...';
cmd /c call docker stop php54 php55 php56 php70 php71 php72
cmd /c call docker restart php73 mysql57 nginx
echo 'Finished...';
