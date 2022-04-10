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

$startfolder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
$userStartfolder = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"

Function RemoveFolderFromStart($folder) {
    Remove-Item -path "$startfolder$folder" -recurse -Force -ErrorAction "SilentlyContinue"
    Write-Host "Removed '$startfolder$folder'"
}

Copy-Item "$userStartfolder" -Destination "$startfolder..\" -Recurse -Force
mkdir "$startfolder\Windows\" -ErrorAction "SilentlyContinue"
Remove-Item "$startfolder" -Recurse -Include "Administrative Tools.lnk"
Move-Item "$startfolder\Accessibility\" -Destination "$startfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$startfolder\Accessories\" -Destination "$startfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$startfolder\Administrative Tools\" -Destination "$startfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$startfolder\Windows PowerShell\" -Destination "$startfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Move-Item "$startfolder\System Tools\" -Destination "$startfolder\Windows\" -Force -ErrorAction "SilentlyContinue"
Remove-Item -Path "$userStartfolder\*\" -recurse -Force

Remove-Item "$startfolder" -Recurse -Include "Notepad.lnk"
Remove-Item "$startfolder" -Recurse -Include "Paint.lnk"
Remove-Item "$startfolder" -Recurse -Include "Wordpad.lnk"
Remove-Item "$startfolder" -Recurse -Include "Windows Media Player.lnk"
Remove-Item "$startfolder" -Recurse -Include "Steps Recorder.lnk"
Remove-Item "$startfolder" -Recurse -Include "Snipping Tool.lnk"
Remove-Item "$startfolder" -Recurse -Include "Internet Explorer.lnk"
Remove-Item "$startfolder" -Recurse -Include "Character Map.lnk"

RemoveFolderFromStart("Git")
RemoveFolderFromStart("Rust")
RemoveFolderFromStart("Node.js")
RemoveFolderFromStart("Java")
RemoveFolderFromStart("Pandoc")
RemoveFolderFromStart("Maintenance")
RemoveFolderFromStart("Windows Kits")
RemoveFolderFromStart("Visual Studio 2022")

StartMenuCleanup("$startfolder")

Move-Item -Path "$startfolder\*\*.lnk" -Destination "$startfolder\" -Exclude "$startfolder\Windows\" -Force -PassThru -ErrorAction "SilentlyContinue"

try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/main/Settings-start.lnk" -OutFile "${startfolder}/Settings-Start.lnk" -PassThru
}
catch {}
