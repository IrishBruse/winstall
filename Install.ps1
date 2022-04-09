# Prompt that admin is needed
$id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$p = New-Object System.Security.Principal.WindowsPrincipal($id)
if (!$p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Run as Administrator!"
    break;
}

# Admin code here

Function Section {
    Param (
        [parameter(Mandatory)]
        [String]$Name,
        [parameter(Mandatory)]
        [Object]$ScriptBlock
    )

    Begin {
        Write-Output "$Name"
        If ($PSBoundParameters['Name']) {
            If ($ScriptBlock -isnot [scriptblock]) {
                $ScriptBlock = [scriptblock]::Create("Write-Output($Name)")
            }
        }
    }

    Process {
        $ScriptBlock.InvokeReturnAsIs()
        Write-Output "Done $Name`n"
    }
}

Write-Output "-- Registry Hacks --"
Section -Name "General Registry Hacks" -ScriptBlock {
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseSpeed 0 # Disable mouse acceleration
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold1 0 # Disable mouse acceleration
    Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold2 0 # Disable mouse acceleration

    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys V # Disable default win V shortcut Clipboard
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys E # Disable default win E shortcut Explorerer

    Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" HideRecentlyAddedApps 1 # Disable "Recently added"

    # misc no idea what this does oops
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" ColorPrevalence 1
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM" ColorPrevalence 1
    Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\sppsvc\" Start 4
}

Section -Name "Taskbar Registry Hacks" -ScriptBlock {
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ExtendedUIHoverTime 50000
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" Hidden 1
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" HideFileExt 0
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" LaunchTo 1 # Change Open File Explorer to This PC
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarEnabled 1 # Enable task bar on other monitors
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarGlomLevel 2 # Dont Combine Taskbar on other monitors
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" MMTaskbarMode 2 # Taskbar where window is open
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ShowSuperHidden 0
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" TaskbarGlomLevel 2 # Dont Combine Taskbar}
}

Section -Name "Removing This PC Folders" -ScriptBlock {
    Write-Host "    Removed Desktop From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" -Force -Verbose

    Write-Host "    Removed Documents From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Force -Verbose

    Write-Host "    Removed Downloads From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Force -Verbose

    Write-Host "    Removed Music From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Force -Verbose

    Write-Host "    Removed Pictures From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Force -Verbose

    Write-Host "    Removed Videos From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Force -Verbose

    Write-Host "    Removed 3d Objects From This PC"
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose
    Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Force -Verbose
}

Section -Name "Copying Alacritty Config" -ScriptBlock {
    mkdir "$env:USERPROFILE\AppData\Local\alacritty\"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/dotfiles/main/.alacritty.yml" -OutFile "$env:USERPROFILE\AppData\Local\alacritty\alacritty.yml"
}

Write-Output "-- Create task to cleanup startmenu --"
Register-ScheduledJob -Name CleanUpStart -ScriptBlock { Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/IrishBruse/winstall/main/Starmenu.ps1')) } -Trigger (New-JobTrigger -Frequency="AtLogon")

Write-Output "-- Sync Config Setup (W.I.P) --"
# Section -Name "Copying Powershell Profile" -ScriptBlock {
#     mkdir "$env:USERPROFILE\Documents\WindowsPowerShell\"
#     $powershellConfigUrl = "https://raw.githubusercontent.com/IrishBruse/dotfiles/main/.chezmoitemplates/powershell"
#     $powershellConfig = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
#     Invoke-WebRequest -Uri $powershellConfigUrl -OutFile $powershellConfig
# }

# Section -Name "Copying Alacritty Config" -ScriptBlock {
#     mkdir "$env:USERPROFILE\AppData\Local\alacritty\"
#     $alacrittyUrl = "https://raw.githubusercontent.com/IrishBruse/dotfiles/main/.alacritty.yml"
#     $alacritty = "$env:USERPROFILE\AppData\Local\alacritty\alacritty.yml"
#     Invoke-WebRequest -Uri $alacrittyUrl -OutFile $alacritty
# }

Write-Output "-- Setup Winget --"

Section -Name "2 Min wait" -ScriptBlock {
    wsreset -i
    TimeOut 120
}

Section -Name "Install Visual C" -ScriptBlock {
    Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile "$env:TEMP/Microsoft.VCLibs.x64.14.00.Desktop.appx"
    add-appxpackage -Path "$env:TEMP/Microsoft.VCLibs.x64.14.00.Desktop.appx"
}

Section -Name "Install Winget package manager" -ScriptBlock {
    Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "$env:TEMP/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    add-appxpackage -Path "$env:TEMP $env:TEMP/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
}

Section -Name "Install Winget Packages" -ScriptBlock {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/main/packages.json" -OutFile $env:TEMP/packages.json
    winget import $env:TEMP/packages.json
}
