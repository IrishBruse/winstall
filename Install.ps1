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




Write-Output "Optional Windows Features"
Write-Output "    Enabling Microsoft-Windows-Subsystem-Linux"
try { Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux }catch {}

Write-Output "    Disabling Internet-Explorer-Optional-amd64"
try { Disable-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 }catch {}
Write-Output "Done`n"




Write-Output "Setup Winget"
# Check if winget is installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
    Write-Output "    Winget Already Installed Skipping"

}
else {
    # Installing winget from the Microsoft Store
    Write-Host "Winget not found, installing it now."
    $ResultText.text = "`r`n" + "`r`n" + "Installing Winget... Please Wait"
    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
    $nid = (Get-Process AppInstaller).Id
    Wait-Process -Id $nid
    Write-Host Winget Installed
    $ResultText.text = "`r`n" + "`r`n" + "Winget Installed - Ready for Next Task"

    Write-Output "    Installing Microsoft Store"
    wsreset -i
    Timeout 120

    Write-Output "    Installing Visual C"
    Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile "$env:TEMP/Microsoft.VCLibs.x64.14.00.Desktop.appx"
    add-appxpackage -Path "$env:TEMP/Microsoft.VCLibs.x64.14.00.Desktop.appx"

    Write-Output "    Installing Winget Package Manager"
    Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "$env:TEMP/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    add-appxpackage -Path "$env:TEMP/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

    Write-Output "    Installing Winget Programming Libraries"
    winget install OpenJS.NodeJS.LTS
    winget install Python.Python.3
    winget install Rustlang.Rust.GNU
    winget install GoLang.Go
    winget install Microsoft.dotnet
    winget install Microsoft.dotnetRuntime.6-x64
    winget install LLVM.LLVM

    Write-Output "    Installing Winget Software"
    winget install 7zip.7zip
    winget install Alacritty.Alacritty
    winget install AntibodySoftware.WizTree
    winget install clsid2.mpc-hc
    winget install deepnight.LDtk
    winget install Discord.Discord
    winget install Ditto.Ditto
    winget install gerardog.gsudo
    winget install Git.Git
    winget install Klocman.BulkCrapUninstaller
    winget install Microsoft.Edge
    winget install Microsoft.EdgeWebView2Runtime
    winget install Microsoft.Teams
    winget install Microsoft.VisualStudioCode
    winget install Microsoft.WingetCreate
    winget install Rufus.Rufus
    winget install SoftDeluxe.FreeDownloadManager
    winget install UnityTechnologies.UnityHub
    RefreshEnv.cmd

    Write-Output "    Installing Npm Global Tools"
    npm install -g @angular/cli
    npm install -g @ionic/cli
    npm install -g @vue/cli
    npm install -g quicktype
    npm install -g vsce
    npm install -g cordova

    Write-Output "    Installing Npm Global Tools"

}
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




Write-Output "Sync Configs (W.I.P)"
$path = "C:/Path/"
$p = (Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$p += ";$path"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $p
mkdir $path
Invoke-WebRequest -Uri "https://github.com/IrishBruse/DotManager/releases/latest/download/dot.exe" -OutFile "$path/dot.exe"
Write-Output "Done`n"




Write-Output "Setting git config --global"
git config --global user.name "IrishBruse"
git config --global user.email "Econn50@outlook.com"
git config --global init.defaultBranch main
Write-Output "Done`n"




Write-Output "Restarting Explorer"
Stop-Process -processName: Explorer
Write-Output "Done`n"
