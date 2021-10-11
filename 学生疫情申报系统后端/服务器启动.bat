@echo off
cd /d %~dp0
start java -Dfile.encoding=utf-8 -jar lib\HttpReceive-1.0-SNAPSHOT.jar 

