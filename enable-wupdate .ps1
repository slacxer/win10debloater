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

Write-Host "[i] Enabling Windows Update"

sc.exe config wuauserv start=demand
sc.exe query wuauserv

$svc_list = @("WaaSMedicSvc", "wuauserv")
foreach($svc in $svc_list) {
    if($(Test-Path "HKLM:\SYSTEM\ControlSet001\Services\$svc")) {
      if($(Test-RegistryValue -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Value "Start")) {
        if( $(Get-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc").Start -eq 3) {
            Write-Host "        [i] Service $svc already enabled"
        } else {
            Write-Host "        [i] Enable service $svc (next reboot)"
            Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Name Start -Value 3
            $need_reboot = $true
        }
      } else {
        Write-Host "        [i] Adding $svc/Start Key (next reboot)"
        New-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\$svc" -Name "Start" -Value 3 -PropertyType DWord
      }
    } else {
        Write-Host "        [i] Service $svc already deleted"
    }
}

if($(Test-Path "HKLM:\SYSTEM\ControlSet001\Services\UsoSvc")) {
        if( $(Get-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\UsoSvc").Start -eq 2) {
            Write-Host "        [i] Service UsoSvc already enabled"
        } else {
            Write-Host "        [i] Enable service UsoSvc (next reboot)"
            Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\UsoSvc" -Name Start -Value 2
            $need_reboot = $true
        }
} else {
        Write-Host "        [i] Service UsoSvc already deleted"
}

if($(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching")) {
        if( $(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching").SearchOrderConfig -eq 1) {
            Write-Host "        [i] Service SearchOrderConfig already enabled"
        } else {
            Write-Host "        [i] Enable service SearchOrderConfig (next reboot)"
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" -Name SearchOrderConfig -Value 1
            $need_reboot = $true
        }
} else {
        Write-Host "        [i] Service SearchOrderConfig already deleted"
}

