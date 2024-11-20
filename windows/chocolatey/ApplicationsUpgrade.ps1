# Check outdated packages installed via Chocolatey and upgrade them if new versions available.

function OutdatedPackages {
        Write-Host "Checking for outdated packages `n"
        Invoke-Command -ScriptBlock {choco outdated --limit-output | ForEach-Object{ $_.Split('|')[0]; } }
}

$output = OutdatedPackages
function UpgradePackages {
    Invoke-Command -ScriptBlock {choco upgrade $output --yes}
}

function CleanupTempFiles {
    Remove-Item -Recurse -Force 'C:\Users\Vinay.HOME-PC\AppData\Local\Temp\chocolatey'
}

UpgradePackages
CleanupTempFiles