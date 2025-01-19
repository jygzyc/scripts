@echo off

@REM WARNING: This function is not stable!
@REM IPV4 Port Forwarding for Windows to WSL
@REM netsh interface portproxy add v4tov4 listenport=[Windows port] listenaddress=0.0.0.0 connectport=[WSL port] connectaddress=[wsl ip]
for /f "tokens=*" %a in ('wsl hostname -I') do @set WSL_IP=%a
@REM Android ADB Port Forwarding
netsh interface portproxy add v4tov4 listenport=5037 listenaddress=0.0.0.0 connectport=5037 connectaddress=%WSL_IP%
@REM IDA Pro Port Forwarding
netsh interface portproxy add v4tov4 listenport=20742 listenaddress=0.0.0.0 connectport=20742 connectaddress=%WSL_IP%
netsh interface portproxy add v4tov4 listenport=20743 listenaddress=0.0.0.0 connectport=20743 connectaddress=%WSL_IP%
@REM Clash Port Forwarding
netsh interface portproxy add v4tov4 listenport=7890 listenaddress=0.0.0.0 connectport=7890 connectaddress=%WSL_IP%
pause