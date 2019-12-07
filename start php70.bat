@echo off
echo 'Start php70...';
cmd /c call docker stop php54
cmd /c call docker stop php55
cmd /c call docker stop php56
cmd /c call docker stop php71
cmd /c call docker stop php72
cmd /c call docker stop php73
cmd /c call docker restart php70
cmd /c call docker restart mysql57
cmd /c call docker restart nginx
echo 'Finished...';
