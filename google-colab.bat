@echo off

set max_h=12
set wait_s=600
set /a count_num=%max_h%*(3600/%wait_s%)
set url=https://colab.research.google.com/drive/1FfTkeYY3XLIygvmy_t0CPIc0dixuLGNe
set file=google-colab.log

if exist %file% del %file%

setlocal enabledelayedexpansion
for /l %%i in (1,1,%count_num%) do (
  set log=^[!date! !time!^] Connect %%i/%count_num%
  start %url%
  echo !log!
  echo !log! >> %file%
  timeout %wait_s% > nul /nobreak
)
endlocal