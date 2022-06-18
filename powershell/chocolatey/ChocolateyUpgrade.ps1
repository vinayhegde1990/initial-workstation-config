# Check outdated packages installed via Chocolatey on a system and upgrade them if new versions available.

function OutdatedPackages {
        Write-Host "Checking for outdated packages `n"
        Invoke-Command -ScriptBlock {choco outdated --limit-output | ForEach-Object{ $_.Split('|')[0]; } }
}

$output = OutdatedPackages
function UpgradePackages {
    Invoke-Command -ScriptBlock {choco upgrade $output --yes}
    Write-Host "Outdated packages upgraded via chocolatey"
}

function CleanupTempFiles {
    Remove-Item -Recurse -Force 'C:\Users\Vinay\AppData\Local\Temp\chocolatey'
}

UpgradePackages
CleanupTempFiles