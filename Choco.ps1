#Requires -RunAsAdministrator

$packages = @(
    # Fonts
    "cascadiacode"
    "cascadiamono"

    "7zip"
    "vscode"
    "discord"
    "alacritty"
    "mpc-be"
    "freedownloadmanager"
    "powertoys"
    "paint.net"

    # Programming
    "git"
    "dotnet"
    "dotnet-sdk"
    "rust-ms"
    "python"
    "nodejs-lts"
    "visualstudio2022buildtools"
    "visualstudio2022-workload-vctools"
    "tinycc"

    # Game engine
    "unity-hub"
    "blender"
)

Write-Output "--- Installing Chocolatey ---"
iex ((New-Object System.Net.WebClient).DownloadString("https://community.chocolatey.org/install.ps1"))

refreshenv

Write-Output "Set choco config allowGlobalConfirmation"
choco feature enable -n allowGlobalConfirmation

foreach ($pkg in $packages)
{
    choco.exe install $pkg -y
}
