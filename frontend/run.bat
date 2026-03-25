@echo off
cd /d %~dp0
echo 正在安装依赖...
call npm install
echo 正在启动前端服务...
call npm run dev
pause
