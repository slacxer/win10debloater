function Test-RegistryValue {

param (

 [parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Path,

[parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Value
)

try {

Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Value -ErrorAction Stop | Out-Null
 return $true
 }

catch {

return $false

}

}

Write-Host "[i] Disabling Windows Update"

net stop wuauserv
sc.exe stop wuauserv
sc.exe config wuauserv start=disabled
sc.exe query wuauserv
sc.exe stop wuauserv

$svc_list = @("UsoSvc", "WaaSMedicSvc", "wuauserv")
foreach($svc in $svc_list) {
    if($(Test-Path "HKLM:\SYSTEM\ControlSet001\Services\$svc")) {
      if($(Test-RegistryValue -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Value "Start")) {
        if( $(Get-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc").Start -eq 4) {
            Write-Host "        [i] Service $svc already disabled"
        } else {
            Write-Host "        [i] Disable service $svc (next reboot)"
            Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Name Start -Value 4
            $need_reboot = $true
        }
      } else {
        Write-Host "        [i] Adding $svc/Start Key (next reboot)"
        New-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Name "Start" -Value 4 -PropertyType DWord
      }
    } else {
        Write-Host "        [i] Service $svc already deleted"
    }
}

if($(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching")) {
        if( $(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching").SearchOrderConfig -eq 0) {
            Write-Host "        [i] Service SearchOrderConfig already disabled"
        } else {
            Write-Host "        [i] Disable service SearchOrderConfig (next reboot)"
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name SearchOrderConfig -Value 0
            $need_reboot = $true
        }
} else {
        Write-Host "        [i] Service SearchOrderConfig already deleted"
}

Write-Host "[i] Disable 'Updates are available' message"

$objSID = New-Object System.Security.Principal.SecurityIdentifier "S-1-1-0"
$EveryOne = $objSID.Translate( [System.Security.Principal.NTAccount]).Value

takeown /F "$env:WinDIR\System32\MusNotification.exe"
icacls "$env:WinDIR\System32\MusNotification.exe" /deny "$($EveryOne):(X)"
takeown /F "$env:WinDIR\System32\MusNotificationUx.exe"
icacls "$env:WinDIR\System32\MusNotificationUx.exe" /deny "$($EveryOne):(X)"
Start-Sleep -s 3
Write-Host "[i] Done....."
