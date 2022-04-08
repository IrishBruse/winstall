Write-Host "Install Visual C"
    Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile "./Microsoft.VCLibs.x64.14.00.Desktop.appx"
    add-appxpackage -Path "./Microsoft.VCLibs.x64.14.00.Desktop.appx"

Write-Host "Install Winget package manager"
    Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "./Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    add-appxpackage -Path "./Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

Write-Host "Install Winget Packages"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/master/packages.json" -OutFile ./packages.json
    winget import ./packages.json

Write-Host "Running Windows Customization Registry"
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseSpeed 0 # Disable mouse acceleration
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold1 0 # Disable mouse acceleration
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold2 0 # Disable mouse acceleration
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys V # Disable "Recently added"
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" ColorPrevalence 1
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM" ColorPrevalence 1
    Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" HideRecentlyAddedApps 1 # Disable "Recently added"
    Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\sppsvc\" Start 4
    Stop-Process -processname explorer

Write-Host "Removing File Explorer Folders"
    Write-Host "Remove Desktop From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" -Force -Verbose
    Write-Host "Remove Documents From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose
    Write-Host "Remove Downloads From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose
    Write-Host "Remove Music From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose
    Write-Host "Remove Pictures From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose
    Write-Host "Remove Videos From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose
    Write-Host "Remove 3d Objects From This PC"
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose
        Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose

Write-Host "Removing File Explorer Folders"
    $explorerAdvancedKey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty $explorerAdvancedKey ExtendedUIHoverTime 50000
    Set-ItemProperty $explorerAdvancedKey Hidden 1
    Set-ItemProperty $explorerAdvancedKey HideFileExt 0
    Set-ItemProperty $explorerAdvancedKey LaunchTo 1 # Change Open File Explorer to This PC
    Set-ItemProperty $explorerAdvancedKey MMTaskbarEnabled 1 # Enable task bar on other monitors
    Set-ItemProperty $explorerAdvancedKey MMTaskbarGlomLevel 2 # Dont Combine Taskbar on other monitors
    Set-ItemProperty $explorerAdvancedKey MMTaskbarMode 2 # Taskbar where window is open
    Set-ItemProperty $explorerAdvancedKey ShowSuperHidden 0
    Set-ItemProperty $explorerAdvancedKey TaskbarGlomLevel 2 # Dont Combine Taskbar
    Set-ItemProperty $explorerAdvancedKey TaskbarSmallIcons 1 # Small taskbar

Write-Host "Setting Git Credentials"
    git config --global user.name "IrishBruse"
    git config --global user.email "Econn50@outlook.com"

Write-Host "Install dotfiles"
    Write-Host "Powershell Profile"
        mkdir "$env:USERPROFILE\Documents\WindowsPowerShell\"
        $powershellConfigUrl = "https://raw.githubusercontent.com/IrishBruse/dotfiles/main/.chezmoitemplates/powershell"
        $powershellConfig = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
        Invoke-WebRequest -Uri $powershellConfigUrl -OutFile $powershellConfig
    Write-Host "Alacritty Config"
        mkdir "$env:USERPROFILE\AppData\Local\alacritty\"
        $alacrittyUrl = "https://raw.githubusercontent.com/IrishBruse/dotfiles/main/.alacritty.yml"
        $alacritty = "$env:USERPROFILE\AppData\Local\alacritty\alacritty.yml"
        Invoke-WebRequest -Uri $alacrittyUrl -OutFile $alacritty
