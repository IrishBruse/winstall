# winstall

My install script for when i reinstall windows 10

Run this as admin to install
```powershell
set-executionpolicy remotesigned
```

```powershell
irm https://massgrave.dev/get | iex
```

```powershell
irm raw.githubusercontent.com/IrishBruse/winstall/main/Registry.ps1 | iex
```

```powershell
irm raw.githubusercontent.com/IrishBruse/winstall/main/Explorer.ps1 | iex
```

```powershell
irm raw.githubusercontent.com/IrishBruse/winstall/main/Choco.ps1 | iex
```

Make taskbar big for (laptop)
```powershell
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarSmallIcons 0
```

https://superuser.com/questions/1245923/registry-keys-to-change-personalization-settings#1395560
