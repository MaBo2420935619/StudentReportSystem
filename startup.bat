@echo off
chcp 65001

cd /d %~dp0学生疫情申报系统后端\resdis\Redis-x64-3.2.100
start redis-server


cd /d %~dp0学生疫情申报系统前端vue
start npm run serve


cd /d %~dp0学生疫情申报系统后端\lib
start java -Dfile.encoding=utf-8 -jar HttpReceive-1.0-SNAPSHOT.jar 

start "" % SoftWareRoot % "http://localhost:8080/"