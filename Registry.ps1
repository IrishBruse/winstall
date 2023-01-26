#Requires -RunAsAdministrator

Write-Output "--- General Registry Hacks ---"
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseSpeed 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold1 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\Control Panel\Mouse" MouseThreshold2 0 # Disable mouse acceleration
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" DisabledHotkeys V # Disable default win V shortcut Clipboard P for color picker
Set-ItemProperty "HKCU:\Control Panel\Desktop" LogPixels 96 # Set scaling to 100%
Set-ItemProperty "HKCU:\Control Panel\Desktop" Win8DpiScaling 1 # Set scaling to 100%
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\sppsvc\" Start 0 # Start this services

Write-Output "--- Taskbar Registry Hacks ---"
Set-ItemProperty "HKCU:\Control Panel\International" -Name sShortTime -Value "h:mm tt";
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  Hidden 1
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  HideFileExt 0          # enable file extensions
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  LaunchTo 1             # Change Open File Explorer to This PC
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  MMTaskbarEnabled 1     # Enable task bar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  MMTaskbarGlomLevel 2   # Dont Combine Taskbar on other monitors
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  MMTaskbarMode 2        # Taskbar where window is open
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  TaskbarGlomLevel 2     # Dont Combine Taskbar
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  TaskbarSmallIcons 1    # Taskbar small
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  ShowTaskViewButton 0   # Hide tasks button
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"             SearchboxTaskbarMode 0 # Remove searchbox
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"  ShowSuperHidden 0      # Dont Shows desktop.ini
New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer                             # Meet now
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name HideSCAMeetNow -Value 1

Write-Output "--- Color Registry Hacks ---"
$ActiveColor = 0x24221e
$InactiveColor = 0x2a2723
Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                            AccentColorInactive -ErrorAction "SilentlyContinue" # Inactive Window Title Bar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent"    AccentColorMenu      $ActiveColor                   # Active Window Border
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                               AccentColor          $ActiveColor                   # Active Window Title Bar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                               AccentColorInactive  $InactiveColor                 # Inactive Window Title Bar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" EnableTransparency   0                              # Transparency effects
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ColorPrevalence      1                              # Start, taskbar, and action center
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                               ColorPrevalence      1                              # Title bars
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" AppsUseLightTheme    0                              # Default app mode
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                               EnableAeroPeek       0                              # Disable Aero Peek
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM"                               EnableAeroPeek       0                              # Disable Aero Peek

Write-Output "--- Remove from right click context menu ---"
Remove-Item -Path "HKCR:\Directory\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\Directory\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\LibraryFolder\background\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\LibraryFolder\background\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKCR:\Directory\shell\WizTree" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\git_gui" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\git_shell" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
Remove-Item -Path "HKLM:\SOFTWARE\Classes\Directory\background\shell\cmd\AnyCode" -ErrorAction "SilentlyContinue" -Force -Recurse -Confirm:$false;
