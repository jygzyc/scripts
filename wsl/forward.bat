@echo off
@REM netsh interface portproxy add v4tov4 listenport=[win10端口] listenaddress=0.0.0.0 connectport=[虚拟机的端口] connectaddress=[虚拟机的ip]


netsh interface portproxy add v4tov4 listenport=20742 listenaddress=0.0.0.0 connectport=20742 connectaddress=
netsh interface portproxy add v4tov4 listenport=20743 listenaddress=0.0.0.0 connectport=20743 connectaddress=