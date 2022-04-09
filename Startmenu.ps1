# Remove empty directories locally
Function StartMenuCleanup($path) {
    Get-ChildItem $path -recurse -include Uninstall* | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include Help* | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include *Help | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include *Manuals* | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include *Docs* | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include *Python* | remove-item -ErrorAction "SilentlyContinue"
    Get-ChildItem $path -recurse -include *.url | remove-item -ErrorAction "SilentlyContinue"

    Get-ChildItem -Path $path -recurse -include *.lnk -File | Move-Item -Destination $path -ErrorAction "SilentlyContinue"
}

# Remove empty directories locally
Function RemoveEmptyFoldersFromStart($path) {
    # Go through each subfolder,
    Foreach ($subFolder in Get-ChildItem -Force -Literal $path -Directory) {
        # Call the function recursively
        RemoveEmptyFoldersFromStart -path $subFolder.FullName
    }
    # Get all child itemse
    $subItems = Get-ChildItem -Force:$getHiddelFiles -LiteralPath $path
    # If there are no items, then we can delete the folder
    # Exluce folder: If (($subItems -eq $null) -and (-Not($path.contains("DfsrPrivate"))))
    If ($null -eq $subItems) {
        Write-Host "`n`nRemoving empty folder '${path}'`n`n"
        Remove-Item -Force -Recurse:$removeHiddenFiles -LiteralPath $Path -ErrorAction "SilentlyContinue"
    }
}

Function RemoveAppFromStart($folder) {
    Remove-Item -path "$startfolder${folder}" -recurse -Force -ErrorAction "SilentlyContinue"
}

$startfolder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\";

Move-Item -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\*" -Destination "$startfolder" -PassThru -ErrorAction "SilentlyContinue"

RemoveAppFromStart("Git")
RemoveAppFromStart("Rust")
RemoveAppFromStart("Accessories")
RemoveAppFromStart("Node.js")
RemoveAppFromStart("Java")
RemoveAppFromStart("Windows Kits")
RemoveAppFromStart("Visual Studio 2022")

StartMenuCleanup -path "$startfolder"
RemoveEmptyFoldersFromStart -path "$startfolder"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/IrishBruse/winstall/main/Settings-start.lnk" -OutFile "${startfolder}/Startup/Settings-Start.lnk"
