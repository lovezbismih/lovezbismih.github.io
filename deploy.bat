@echo off
REM 进入你的 Git 项目目录
cd C:\Users\lovez\Desktop\VPS\blog

REM 执行 Git 命令
git add .
git commit -m "two commit"
git branch -M main
git remote add origin git@github.com:lovezbismih/lovezbismih.github.io.git
git push -u origin main

echo Git 操作完成！
pause
