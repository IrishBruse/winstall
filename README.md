# winstall

My install script for when i reinstall windows 10

Run this as admin to install
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/IrishBruse/winstall/main/Install.ps1'))
```

Enable Small task bar on desktop
```powershell
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarSmallIcons 0 # Small taskbar
```
