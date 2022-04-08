Write-Host "Enabling Small taskbar"
    $explorerAdvancedKey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty $explorerAdvancedKey TaskbarSmallIcons 1 # Small taskbar

Stop-Process -processname explorer
