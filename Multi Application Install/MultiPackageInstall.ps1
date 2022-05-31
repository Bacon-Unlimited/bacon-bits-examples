Write-Output "echo Installing VLC Media Player"
Start-Process "c:\temp\bacon\vlc-3.0.16-win64.exe" -ArgumentList "/L=1033 /S"


# Script is used with a bundle to install a .msi file with no window, no restart, and a log file of install saved
#
#
#
Write-Output "Installing Firefox"
$null = mkdir c:\temp\log\ -ErrorAction SilentlyContinue -Force 
$file = "Firefox Setup 96.0.3.msi"
$date = get-date -f yyyyMMdd_HH_mm_ss
$getlogbefore = (Get-ChildItem "C:\temp\log\" | ? { $_.Name -Like "Firefox*" }).Name

foreach ($log in $getlogbefore) {
    $null = del -Path "C:\temp\log\$log" -Force
}

Start-Process c:\temp\bacon\$file -ArgumentList "/quiet /norestart /L c:\temp\log\Firefox_90_MSI_install_logs.log" -Wait

$log = "c:\temp\log\Firefox_90_MSI_install_logs.log"
$logname = [io.path]::GetFileNameWithoutExtension($log)
$ext = [io.path]::GetExtension($log)
$newlogname = "$logname" + "$date" + "$ext"
Rename-Item -Path "c:\temp\log\Firefox_90_MSI_install_logs.log" -NewName $newlogname

$getlogafter = (Get-ChildItem "C:\temp\log\" | ? { $_.Name -Like "Firefox*" }).Name
Get-Content "c:\temp\log\$getlogafter"
Write-Host "Log file saved to c:\temp\log\$getlogafter"