#Remove-Item –path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git" –recurse
#Remove-Item –path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Rust" –recurse
#Remove-Item –path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories" –recurse
#Remove-Item –path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Node.js" –recurse

#Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\7-Zip\7-Zip Help.lnk"

# Remove empty directories locally
Function Cleanup-Startmenu($path)
{
    Get-ChildItem $path -recurse -include Uninstall* | remove-item
    Get-ChildItem $path -recurse -include Help* | remove-item
    Get-ChildItem $path -recurse -include *Help | remove-item
    Get-ChildItem $path -recurse -include *Manuals* | remove-item
    Get-ChildItem $path -recurse -include *Docs* | remove-item

    Get-ChildItem -Path $path -recurse -include *.lnk -File | Move-Item -Destination $path
}

# Remove empty directories locally
Function Delete-EmptyFolder($path)
{
    # Go through each subfolder, 
    Foreach ($subFolder in Get-ChildItem -Force -Literal $path -Directory) 
    {
        # Call the function recursively
        Delete-EmptyFolder -path $subFolder.FullName
    }
    # Get all child items
    $subItems = Get-ChildItem -Force:$getHiddelFiles -LiteralPath $path
    # If there are no items, then we can delete the folder
    # Exluce folder: If (($subItems -eq $null) -and (-Not($path.contains("DfsrPrivate")))) 
    If ($subItems -eq $null) 
    {
        Write-Host "Removing empty folder '${path}'"
        Remove-Item -Force -Recurse:$removeHiddenFiles -LiteralPath $Path
    }
}
# Run the script
Cleanup-Startmenu -path "C:\Users\Econn\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
Cleanup-Startmenu -path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"


Delete-EmptyFolder -path "C:\Users\Econn\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
Delete-EmptyFolder -path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
