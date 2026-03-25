@echo off
echo ========================================
echo 启动中国省级非遗项目可视化平台
echo ========================================

echo.
echo [1/3] 检查MySQL数据库...
echo.

echo [2/3] 启动后端服务 (端口8081)...
start "Backend" cmd /k "cd /d e:\new_local_repo\mybite\backend && mvn spring-boot:run"

timeout /t 15 /nobreak >nul

echo [3/3] 启动前端服务 (端口5173)...
start "Frontend" cmd /k "cd /d e:\new_local_repo\mybite\frontend && npm run dev"

echo.
echo ========================================
echo 平台启动完成！
echo 后端: http://localhost:8081/api
echo 前端: http://localhost:5173
echo ========================================
pause
