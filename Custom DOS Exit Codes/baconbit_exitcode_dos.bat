@echo off

echo ========== NOTES ==========
echo == BaconBits: Custom DOS Exit Codes
echo == This is example code that shows how to use custom exit codes in DOS to set Bacon job returns to SUCCESS or FAILED
echo == Learn more here: https://ss64.com/nt/exit.html
echo ===========================
echo .
echo .
echo ========== RESULTS ==========



set curdir=%cd%
set hellobat=%curdir%\HelloWorld.bat
set hellotxt=%curdir%\HelloWorld.txt
set badtxt=%curdir%\HelloHelloWorld.txt

echo MAKING A FILE
echo echo Hello World ^> %hellotxt% > %hellobat% 
if %ERRORLEVEL% EQU 0 (
	echo Create %hellobat%
) else (
	echo ERROR: failed creating %hellobat% 1>&2
	call :ending 100
)

echo CHECKING FILES
set errorlevel=0
if exist %hellobat% (
	echo %hellobat% exists!
) else (
	echo ERROR: %hellobat% does not exist 1>&2
	call :ending 200
)


echo RUN FILE
set errorlevel=0
call %hellobat% &
if %ERRORLEVEL% EQU 0 (
	echo Running %hellotxt% worked.
) else (
	echo ERROR: could not run %hellobat% 1>&2
	call :ending 300
)



echo CHECK BAD FILE
set errorlevel=0
if exist %hellotxt% (
	echo %hellotxt% exists!
) else (
	echo ERROR: %hellotxt% does not exist 1>&2
	call :ending 400
)


echo CHECK TXT FILE
set errorlevel=0
if exist %badtxt% (
	echo %badtxt% exists!
) else (
	echo ERROR: %badtxt% does not exist 1>&2
	call :ending 500
)


call :ending 0


rem ===== ENDING FUNCTION
:ending
if "%1"=="0" (
	echo SUCCESS
	exit /B 0
)
if "%1"=="100" (
	echo ERROR CODE: %1 1>&2
	exit /B 100
)
if "%1"=="200" (
	echo ERROR CODE: %1 1>&2
	exit /B 200
)
if "%1"=="300" (
	echo ERROR CODE: %1 1>&2
	exit /B 300
)
if "%1"=="400" (
	echo ERROR CODE: %1 1>&2
	exit /B 400
)
if "%1"=="500" (
	echo ERROR CODE: %1 1>&2
	exit /B 500
)