#Requires -RunAsAdministrator

Write-Output "General Registry Hacks"
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseSpeed 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold1 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold2 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys V # Disable default win V shortcut Clipboard P for color picker
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" HideRecentlyAddedApps 1 # Disable "Recently added"
Set-ItemProperty "HKCU:\Control Panel\Desktop" LogPixels 96 # Set scaling to 100%
Set-ItemProperty "HKCU:\Control Panel\Desktop" Win8DpiScaling 1 # Set scaling to 100%
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\sppsvc\" Start 0 # Start this services
Write-Output "Done`n"


Write-Output "Taskbar Registry Hacks"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ExtendedUIHoverTime 50000 # disable aero peek
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Hidden 1
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" HideFileExt 0 # enable file extensions
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" LaunchTo 1 # Change Open File Explorer to This PC
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarEnabled 1 # Enable task bar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarGlomLevel 2 # Dont Combine Taskbar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarMode 2 # Taskbar where window is open
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarGlomLevel 2 # Dont Combine Taskbar
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ShowSuperHidden 0 # Dont Shows desktop.ini
Write-Output "Done`n"


Write-Output "Theme Colors"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent" AccentColorMenu 4282927692
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\DWM" AccentColor 4282927692
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\DWM" AccentColorInactive 4282927692
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\DWM" ColorPrevalence 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ColorPrevalence 1
Write-Output "Done`n"


Write-Output "Removing This PC Folders"
    Write-Host "    Removed Desktop From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed Documents From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed Downloads From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed Music From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed Pictures From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed Videos From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose -ErrorAction "SilentlyContinue"

    Write-Host "    Removed 3d Objects From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose -ErrorAction "SilentlyContinue"
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose -ErrorAction "SilentlyContinue"
Write-Output "Done`n"


Write-Output "    Disabling Internet-Explorer-Optional-amd64"
try { Disable-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 }catch {}
Write-Output "Done`n"


Write-Output "Installing Chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Output "Done`n"


Write-Output "Installing GUI Software"
choco install vscode --version 1.69.0 -y
choco install 7zip --version 22.0 -y
choco install discord --version 1.0.9005 -y
choco install ldtk --version 1.1.3 -y
choco install alacritty --version 0.10.1 -y
choco install mpc-be --version 1.6.3 -y
choco install freedownloadmanager --version 6.16.2 -y
Write-Output "Done`n"


Write-Output "Installing Programming Sofware"
choco install git --version 2.37.0 -y
choco install llvm --version 14.0.6 -y
choco install golang --version 1.18.3 -y
choco install dotnet --version 6.0.6 -y
choco install dotnet-sdk --version 6.0.301 -y
choco install rust --version 1.61.0 -y
choco install python --version 3.10.5 -y
choco install nodejs --version 18.5.0 -y
choco install netfx-4.7.2 --version 4.7.2.0 -y
Write-Output "Done`n"


Write-Output "Installing Game Engine Sofware"
choco install godot --version 3.4.4 -y
choco install unity-hub --version 3.2.0 -y
Write-Output "Done`n"


Write-Output "Remove from right click context menu"
Remove-Item -Path "HKCR:\Directory\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\Directory\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\LibraryFolder\background\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\LibraryFolder\background\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\Directory\shell\WizTree" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\cmd\AnyCode" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Write-Output "Done`n"


Write-Output "Create Shortcut To Cleanup Startmenu"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/main/Startmenu.ps1" -OutFile "$env:APPDATA/Startmenu.ps1"
$shortcut = "$env:APPDATA/Microsoft\Windows\Start Menu\Programs\Settings Clean Startmenu.lnk"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($shortcut)
$ShortCut.TargetPath = "PowerShell.exe"
$ShortCut.Arguments = "-Command `"Start-Process powershell -Verb runas -ArgumentList '-Command','$env:APPDATA/Startmenu.ps1'`""
$Shortcut.Save()
Write-Output "Done`n"


Write-Output "Setting git config --global"
git config --global user.name "IrishBruse"
git config --global user.email "Econn50@outlook.com"
git config --global init.defaultBranch main
Write-Output "Done`n"


Write-Output "Restarting Explorer"
Stop-Process -processName: Explorer
Write-Output "Done`n"
