@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

cd /d %~dp0

echo ========================================
echo 启动前端服务
echo ========================================

echo.
echo [1] 正在安装依赖...
call npm install --legacy-peer-deps
if errorlevel 1 (
    echo 安装失败，请重试
    pause
    exit /b 1
)

echo.
echo [2] 正在启动前端...
call npm run dev

pause
