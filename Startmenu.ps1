# Prompt that admin is needed
$id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$p = New-Object System.Security.Principal.WindowsPrincipal($id)
if (!$p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Run as Administrator!"
    break;
}

# Remove empty directories locally
Function StartMenuCleanup($path) {
    Get-ChildItem $path -recurse -include *Uninstall* | Remove-Item
    Get-ChildItem $path -recurse -include *Help* | Remove-Item
    Get-ChildItem $path -recurse -include *Manuals* | Remove-Item
    Get-ChildItem $path -recurse -include *Docs* | Remove-Item
    Get-ChildItem $path -recurse -include *Python* | Remove-Item
    Get-ChildItem $path -recurse -include *.url | Remove-Item
}

# Remove empty directories recusively
Function RemoveEmptyFoldersFromStart($path) {
    Foreach ($subFolder in Get-ChildItem -Force -Literal $path -Directory) {
        RemoveEmptyFoldersFromStart -path $subFolder.FullName
    }
    $subItems = Get-ChildItem -Force:$getHiddelFiles -LiteralPath $path
    If ($null -eq $subItems) {
        Write-Host "Removing empty folder '${path}'"
        Remove-Item -Force -Recurse:$removeHiddenFiles -LiteralPath $Path
    }
}

$startfolder = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$userStartfolder = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"

Function RemoveFolderFromStart($folder) {
    Remove-Item -path "$userStartfolder$folder" -recurse -Force -ErrorAction "SilentlyContinue"
    Write-Host "Removed '$userStartfolder$folder'"
}

Copy-Item "$startfolder" -Destination "$userStartfolder..\" -Recurse -Force
mkdir "$userStartfolder\Windows\" -ErrorAction "SilentlyContinue"
Remove-Item "$userStartfolder" -Recurse -Include "Administrative Tools.lnk"
Move-Item "$userStartfolder\Accessibility\" -Destination "$userStartfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$userStartfolder\Accessories\" -Destination "$userStartfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$userStartfolder\Administrative Tools\" -Destination "$userStartfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$userStartfolder\Windows PowerShell\" -Destination "$userStartfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$userStartfolder\System Tools\" -Destination "$userStartfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Remove-Item -Path "$startfolder\*\" -recurse -Force

Remove-Item "$userStartfolder" -Recurse -Include "Notepad.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Paint.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Wordpad.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Windows Media Player.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Steps Recorder.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Snipping Tool.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Internet Explorer.lnk"
Remove-Item "$userStartfolder" -Recurse -Include "Character Map.lnk"

RemoveFolderFromStart("Git")
RemoveFolderFromStart("Rust")
RemoveFolderFromStart("Node.js")
RemoveFolderFromStart("Java")
RemoveFolderFromStart("Pandoc")
RemoveFolderFromStart("Maintenance")
RemoveFolderFromStart("Windows Kits")
RemoveFolderFromStart("Visual Studio 2022")

StartMenuCleanup("$userStartfolder")

Move-Item -Path "$userStartfolder\*\*.lnk" -Destination "$userStartfolder\" -Exclude "$userStartfolder\Windows\" -Force -PassThru -ErrorAction "SilentlyContinue"

Start-Sleep 1

RemoveEmptyFoldersFromStart("$userStartfolder")

try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/main/Settings-start.lnk" -OutFile "${startfolder}/Settings-Start.lnk" -PassThru
}
catch {}
