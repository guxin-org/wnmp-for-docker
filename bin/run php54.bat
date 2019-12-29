@echo off
echo 'Start php54...';
cmd /c call docker stop php55 php56 php70 php71 php72 php73 
cmd /c call docker restart php54 mysql57 nginx
echo 'Finished...';
