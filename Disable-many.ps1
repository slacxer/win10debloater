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

Write-Host "[i] Disabling Recent Activity Tracking"

$svc_list = @("EnableActivityFeed", "PublishUserActivities", "UploadUserActivities")
$pathnya = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
foreach($svc in $svc_list) {
    if($(Test-RegistryValue -Path "$pathnya" -Value "$svc")) {
        if( $(Get-ItemProperty -Path "$pathnya").$svc -eq 0) {
            Write-Host "        [i] Key $svc already added, no need to change"
        } else {
            Write-Host "        [i] Changing $svc Key (next reboot)"
            Set-ItemProperty -Path "$pathnya" -Name $svc -Value 0
            $need_reboot = $true
        }
    } else {
        Write-Host "        [i] Adding $svc Key (next reboot)"
        New-ItemProperty -Path $pathnya -Name "$svc" -Value 0 -PropertyType DWord
    }
}

$svc_list = @("NoRecentDocsHistory", "HideSCAMeetNow")
$pathnya = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
if ((Test-Path -Path $pathnya)) {
foreach($svc in $svc_list) {
    if($(Test-RegistryValue -Path "$pathnya" -Value "$svc")) {
        if( $(Get-ItemProperty -Path "$pathnya").$svc -eq 1) {
            Write-Host "        [i] Key $svc already added, no need to change"
        } else {
            Write-Host "        [i] Changing $svc Key (next reboot)"
            Set-ItemProperty -Path "$pathnya" -Name $svc -Value 1
            $need_reboot = $true
        }
    } else {
        Write-Host "        [i] Adding $svc Key (next reboot)"
        New-ItemProperty -Path $pathnya -Name "$svc" -Value 1 -PropertyType DWord
        $need_reboot = $true
    }
}
} else {
    Write-Host "        [i] Adding Explorer key (next reboot)"
    New-item -Path $pathnya
    foreach($svc in $svc_list) {
    if($(Test-RegistryValue -Path "$pathnya" -Value "$svc")) {
        if( $(Get-ItemProperty -Path "$pathnya").$svc -eq 1) {
            Write-Host "        [i] Key $svc already added, no need to change"
        } else {
            Write-Host "        [i] Changing $svc Key (next reboot)"
            Set-ItemProperty -Path "$pathnya" -Name $svc -Value 1
            $need_reboot = $true
        }
    } else {
        Write-Host "        [i] Adding $svc Key (next reboot)"
        New-ItemProperty -Path $pathnya -Name "$svc" -Value 1 -PropertyType DWord
        $need_reboot = $true
    }
}
}


Write-Host "[i] Disabling Notification Center"

$svc_list = @("DisableActionCenter", "DisableNotificationCenter")
$pathnya = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
foreach($svc in $svc_list) {
    if($(Test-RegistryValue -Path "$pathnya" -Value "$svc")) {
        if( $(Get-ItemProperty -Path "$pathnya").$svc -eq 1) {
            Write-Host "        [i] Key $svc already added, no need to change"
        } else {
            Write-Host "        [i] Changing $svc Key (next reboot)"
            Set-ItemProperty -Path "$pathnya" -Name $svc -Value 1
            $need_reboot = $true
        }
    } else {
        Write-Host "        [i] Adding $svc Key (next reboot)"
        New-ItemProperty -Path $pathnya -Name "$svc" -Value 1 -PropertyType DWord
    }
}

if($need_reboot) {
    Write-Host "[+] Please reboot to take effect." -BackgroundColor DarkRed -ForegroundColor White
}