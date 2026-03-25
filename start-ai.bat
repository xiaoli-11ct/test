@echo off
echo ========================================
echo 启动AI分析服务
echo ========================================
cd /d e:\new_local_repo\mybite\ai-service
pip install -r requirements.txt
python main.py
pause
