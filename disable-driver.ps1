Write-Host "[+] Disabling driver offering through Windows Update..."

If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 3
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Type DWord -Value 1
If (!(Test-Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching")) {
    New-Item -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 3
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Device Metadata")) {
    New-Item -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Device Metadata" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1

$regkeys =
'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update',
'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings',
'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Update',
'HKLM:\SOFTWARE\Microsoft\Windows\WindowsUpdate'

foreach ($regkey in $regkeys){
$test = test-path -path $regkey
if(-not($test)){
New-Item -Path $regKey
}
Set-ItemProperty -Path $regkey -Name ExcludeWUDriversInQualityUpdate -Value 1 -Type DWord
}
foreach ($regkey in $regkeys){write-host $regkey}

Write-Host " "
Write-Host "Done..."
Write-Host "Please reboot to take effect." -BackgroundColor DarkRed -ForegroundColor White