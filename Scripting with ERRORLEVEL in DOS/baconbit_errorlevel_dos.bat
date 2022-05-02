@echo off

echo ========== NOTES ==========
echo == BaconBits: Scripting with %ERRORLEVEL% in DOS
echo == This is example code that shows how to use the last errorcode in DOS to set Bacon job returns to SUCCESS or FAILED
echo == Learn more here: https://ss64.com/nt/errorlevel.html
echo ===========================
echo .
echo .
echo ========== RESULTS ==========

echo cd /D C:\TEMP
cd /D C:\TEMP
if %ERRORLEVEL% EQU 0 (
	echo SUCCESS: %errorlevel%
	echo .
) else (
	echo FAILCODE: %ERRORLEVEL% 1>&2
	exit /b %ERRORLEVEL%
)

echo cd /D C:\TEMP\Bacon
cd /D C:\TEMP\Bacon
if %ERRORLEVEL% EQU 0 (
	echo SUCCESS: %errorlevel%
	echo .
) else (
	echo FAILCODE: %ERRORLEVEL% 1>&2
	exit /b %ERRORLEVEL%
)

echo cd /D Q:\TEMP
cd /D Q:\TEMP
if %ERRORLEVEL% EQU 0 (
	echo SUCCESS: %errorlevel%
	echo .
) else (
	echo FAILCODE: %ERRORLEVEL% 1>&2
	exit /b %ERRORLEVEL%
)