@echo off
REM Write current local date/time into compile_time.txt in a stable format.
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy/MM/dd\""') do set DATE_STR=%%i
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format \"HH:mm:ss\""') do set TIME_STR=%%i
del /F /Q compile_time.txt
(
  echo %DATE_STR%
  echo %TIME_STR%
)>> compile_time.txt
