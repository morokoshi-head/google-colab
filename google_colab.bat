@echo off

setlocal enabledelayedexpansion
set max_h=12
set wait_s=3600
set url=<url>
set file=google_colab.log

if exist %file% del %file%

for /l %%i in (1,1,%max_h%) do (
  set log=^[%date% %time%^] Connect %%i/%max_h%
  start %url%
  echo !log!
  echo !log! >> %file%
  timeout %wait_s% > nul /nobreak
)
endlocal
