# Ensure the script is run as Administrator
# If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
#     Write-Host "Please run PowerShell as Administrator!" -ForegroundColor Red
#     exit
# }

# 1. Disable Windows Telemetry & Data Collection
# -------------------------------------------
$HKLM_TelemetryKeys = @(
    "AllowTelemetry"
    "AllowTailoredExperiencesWithDiagnosticData"
)

foreach ($HKLM_TelemetryKeys in $HKLM_TelemetryKeys) {
    Write-Host "Setting $HKLM_TelemetryKeys to 0 for disabling it" -ForegroundColor Yellow
    Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "$HKLM_TelemetryKeys" -Type DWord -Value 0
}

# 2. Disable Windows Advertising 
Write-Host "Disable Windows Advertising ID" -ForegroundColor Yellow
Set-ItemProperty -Path "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0

# 3. Set Windows Feedback Frequency
Write-Host "Set Windows Feedback Frequency" -ForegroundColor Yellow
Set-ItemProperty -Path "HKCU\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0

# 4. Disable Windows Search History on Device
Write-Host "Disable Windows Search History stored on Device" -ForegroundColor Yellow
Set-ItemProperty -Path "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDeviceSearchHistoryEnabled" -Type DWord -Value 0

# 5. Disable Windows Location Access
Write-Host "Disable Windows Location Access" -ForegroundColor Yellow
Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"

# 6. Disable Windows Contacts Access
Write-Host "Disable Windows Contacts Access" -ForegroundColor Yellow
Set-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Type String -Value "Deny"
