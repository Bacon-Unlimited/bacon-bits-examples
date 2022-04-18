## Save currently logged in user to variable
{% set cur_user = salt['cmd.run']('powershell.exe -command "(Get-WMIObject -ClassName Win32_ComputerSystem | select username).username"') %}

## Bginfo folder Path
{% set bginfo_path = 'C:\Bginfo' %}

Download_Bginfo64:
  file.managed:
    - name: {{bginfo_path}}\Bginfo64.exe
    - source: salt://files/033a8695-4059-44d9-8910-ee4bf6727539
    - makedirs: True
    - replace: False

Download_Bgconfig:
  file.managed:
    - name: {{bginfo_path}}\config.bgi
    - source: salt://files/e6ce3ed4-9858-4438-aef6-025d65390f03
    - makedirs: True
    - replace: False
    
Download_Script:
  file.managed:
    - name: {{bginfo_path}}\Replace-UserId.ps1
    - source: salt://files/2a2eaaa4-c95f-4af6-a13a-72894ba61f6f
    - makedirs: True
    - replace: False
    
Create_Task_XML:
  cmd.script:
    - source: {{bginfo_path}}\Replace-UserId.ps1
    - name: {{bginfo_path}}\Replace-UserId.ps1 -Path {{bginfo_path}}\Task.xml -InputUserId {{cur_user}}
    - shell: powershell

Schedule_Task:
  cmd.run:
    - name: schtasks.exe /create /tn "Update BgInfo" /XML "{{bginfo_path}}\Task.xml"