Write-Host "[+] Enabling driver offering through Windows Update..."

Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 0

Remove-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DontPromptForWindowsUpdate" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DontSearchWindowsUpdate" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKLM:\SOFTWARE\MICROSOFT\Windows\CurrentVersion\DriverSearching" -Name "SearchOrderConfig" -Type DWord -Value 0


$regkeys =
'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate',
'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update',
'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings',
'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Update',
'HKLM:\SOFTWARE\Microsoft\Windows\WindowsUpdate'

foreach ($regkey in $regkeys){
$test = test-path -path $regkey
if(-not($test)){
New-Item -Path $regKey
}
Remove-ItemProperty -Path $regkey -Name "ExcludeWUDriversInQualityUpdate" -ErrorAction SilentlyContinue
}

Write-Host " "
Write-Host "Done..."
Write-Host "Please reboot to take effect." -BackgroundColor DarkRed -ForegroundColor White