# Set Git to ask for OpenSSH Key Passphrase only once per session.

function StartSSHAgent {
    Get-Service ssh-agent | Set-Service -StartupType Automatic
    Start-Service ssh-agent
}

function AddSSHPassPhrase {
    Invoke-Command -ScriptBlock { ssh-add "$env:USERPROFILE\.ssh\id_github" }
}

StartSSHAgent
AddSSHPassPhrase