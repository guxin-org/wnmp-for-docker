@echo off
echo 'Start php70...';
cmd /c call docker stop php54 php55 php56 php71 php72 php73
cmd /c call docker restart php70 mysql57 nginx
echo 'Finished...';
