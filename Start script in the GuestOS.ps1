#выполняем скрипт на гостевой ОС:

PS>$script = '"%programfiles%\Common Files\Microsoft Shared\MSInfo\msinfo32.exe" /report "%tmp%\inforeport"'
Invoke-VMScript -ScriptText $script -VM MyVM -HostCredential $hostCredential -GuestCredential $guestCredential -ScriptType Bat
