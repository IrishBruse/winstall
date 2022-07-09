#Requires -RunAsAdministrator

$Desktop = [Environment]::GetFolderPath("Desktop")

cd $Desktop

Write-Output "Activating"
Invoke-RestMethod -Uri "https://github.com/massgravel/Microsoft-Activation-Scripts/archive/refs/tags/1.5.zip" -OutFile Activate.zip
Expand-Archive .\Activate.zip
.\Activate\Microsoft-Activation-Scripts-1.5\MAS\Separate-Files-Version\Activators\HWID-KMS38_Activation\HWID_Activation.cmd /a
Write-Output "Done`n"


Write-Output "General Registry Hacks"
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseSpeed 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold1 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold2 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys V # Disable default win V shortcut Clipboard P for color picker
Set-ItemProperty "HKCU:\Control Panel\Desktop" LogPixels 96 # Set scaling to 100%
Set-ItemProperty "HKCU:\Control Panel\Desktop" Win8DpiScaling 1 # Set scaling to 100%
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\sppsvc\" Start 0 # Start this services
Write-Output "Done`n"


Write-Output "Disable `"Recently added`""
New-Item -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" HideRecentlyAddedApps 1 # Disable "Recently added"
Write-Output "Done`n"


#https://superuser.com/questions/1386302/how-to-replace-the-desktop-background-image-with-a-solid-color-using-powershell
Write-Output "Change wallpaper""
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'WallPaper' -Value ''
Stop-Process -ProcessName explorer
shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization\pageWallpaper
$TIC=(Get-ItemProperty 'HKCU:\Control Panel\Desktop' TranscodedImageCache -ErrorAction Stop).TranscodedImageCache
[System.Text.Encoding]::Unicode.GetString($TIC) -replace '(.+)([A-Z]:[0-9a-zA-Z\\])+','$2'
Write-Output "Done`n"


Write-Output "Taskbar Registry Hacks"
Set-ItemProperty "HKCU:\Control Panel\International" -Name sShortTime -Value "h:mm tt";
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Hidden 1
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" HideFileExt 0 # enable file extensions
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" LaunchTo 1 # Change Open File Explorer to This PC
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarEnabled 1 # Enable task bar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarGlomLevel 2 # Dont Combine Taskbar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarMode 2 # Taskbar where window is open
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarGlomLevel 2 # Dont Combine Taskbar
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarSmallIcons 1 # Taskbar small
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"            SearchboxTaskbarMode 0 # Remove searchbox
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ShowSuperHidden 0 # Dont Shows desktop.ini
Write-Output "Done`n"


Write-Output "Misc Taskbar Registry Hacks"
# Lang input
New-Item -Path HKCU:\Software\Microsoft\CTF\LangBar
Set-ItemProperty -Path HKCU:\Software\Microsoft\CTF\LangBar -Name ShowStatus -Value 3

# Meet now
New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name HideSCAMeetNow -Value 1
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


Write-Output "Installing Chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Output "Done`n"

$packages = @(
    "vscode"
    "7zi"
    "discord"
    "ldtk"
    "alacritty"
    "mpc-be"
    "freedownloadmanager"
    "powertoys"
    "paint.net"
    
    # Programming
    "git"
    "llvm"
    "golang"
    "dotnet"
    "dotnet-sdk"
    "rust"
    "python"
    "nodejs"
    "netfx-4.7.2"
    "visualstudio2022buildtools"
    "tinycc"
    
    # Game engine
    "godot"
    "unity-hub"
    "blender"
    
    # Fonts
    "cascadiacode"
    "opensans"
    
    # Misc
    "gsudo"
)

Write-Output "Installing Chocolatey Software"
foreach ($pkg in $packages)
{
    choco install $pkg -y
}
Write-Output "Done`n"


Write-Output "Set choco config allowGlobalConfirmation"
choco feature enable -n allowGlobalConfirmation
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


Write-Output "Restarting Explorer"
Stop-Process -processName: Explorer
Write-Output "Done`n"
