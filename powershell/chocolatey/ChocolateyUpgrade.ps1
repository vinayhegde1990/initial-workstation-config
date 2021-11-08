# Check outdated packages installed via Chocolatey on a system and upgrade them if new versions available.

function OutdatedPackages {
        Write-Host "Checking for outdated packages `n"
        Invoke-Command -ScriptBlock {choco outdated --limit-output}
        echo $?
}
$output = OutdatedPackages
function UpgradePackages {
    Invoke-Command -ScriptBlock {choco upgrade all --yes}
    Write-Host "Outdated packages upgraded via chocolatey"
}

function CleanupTempFiles {
    Remove-Item -Recurse -Force 'C:\Users\Vinay\AppData\Local\Temp\chocolatey'
}

if ( $output -eq "True" )
{
  Write-Host "Upgrading outdated packages `n"
  UpgradePackages

  CleanupTempFiles
  Write-Host "Deleted temp files to free up space `n"
}
else {
  Write-Host "No new updates available, nothing to be done"
}