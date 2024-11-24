# Create Symlinks to files from this repo to $USERPROFILE directory

function CheckDirectoryPath {
        Write-Host "Checking Directory Path to ensure all files are present`n" -ForegroundColor Yellow
        Get-Location
}

$output = CheckDirectoryPath
function CreateGitSymLinks {
    Write-Host "Creating Git Symlinks" -ForegroundColor DarkMagenta
    ForEach ($git_files in Get-ChildItem -Path "$output\.git-templates\" -Name)
      {
        New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.git-templates\$git_files" -Target "$output\.git-templates\$git_files" -Force
      }
   }

CreateGitSymLinks
