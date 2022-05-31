@echo off

set filename=C:\temp\bacon\tempfile.txt
echo Created internal variable for filename that points to: %filename%

echo checking if %filename% exists...
if exist %filename% (
	echo %filename% exists! Getting file permissions.
	powershell.exe $(dir %filename%).mode
) else (
	echo Sad Face, %filename% does not exist.
)