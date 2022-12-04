# Disable Windows Defender

<#
Options :

-Delete : delete the defender related files (services, drivers, executables, ....) 

Source :  https://bidouillesecurity.com/disable-windows-defender-in-powershell

#>

Write-Host "[+] Disable Windows Defender (as $(whoami))"


## STEP 0 : elevate if needed


if(-Not $($(whoami) -eq "nt authority\system")) {
    $IsSystem = $false

    # Elevate to admin (needed when called after reboot)
    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
        Write-Host "    [i] Elevate to Administrator"
        $CommandLine = "-ExecutionPolicy Bypass `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }

    # Elevate to SYSTEM if psexec is available
    $psexec_path = $(Get-Command PsExec -ErrorAction 'ignore').Source
    if($psexec_path) {
        Write-Host "    [i] Elevate to SYSTEM"
        $CommandLine = " -i -s powershell.exe -ExecutionPolicy Bypass `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments 
        Start-Process -WindowStyle Hidden -FilePath $psexec_path -ArgumentList $CommandLine
        exit
    } else {
        Write-Host "    [i] PsExec not found, will continue as Administrator"
    }

} else {
    $IsSystem = $true
}


## STEP 1 : Disable everything we can with immediate effect


Write-Host "    [+] Add exclusions"

# Add the whole system in Defender exclusions

67..90|foreach-object{
    $drive = [char]$_
    Add-MpPreference -ExclusionPath "$($drive):\" -ErrorAction SilentlyContinue
    Add-MpPreference -ExclusionProcess "$($drive):\*" -ErrorAction SilentlyContinue
}

Write-Host "    [+] Disable scanning engines (Set-MpPreference)"

Set-MpPreference -DisableArchiveScanning 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableBehaviorMonitoring 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableIntrusionPreventionSystem 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableIOAVProtection 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableRemovableDriveScanning 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableBlockAtFirstSeen 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableScanningNetworkFiles 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableScriptScanning 1 -ErrorAction SilentlyContinue
Set-MpPreference -DisableRealtimeMonitoring 1 -ErrorAction SilentlyContinue

Write-Host "    [+] Set default actions to Allow (Set-MpPreference)"

Set-MpPreference -LowThreatDefaultAction Allow -ErrorAction SilentlyContinue
Set-MpPreference -ModerateThreatDefaultAction Allow -ErrorAction SilentlyContinue
Set-MpPreference -HighThreatDefaultAction Allow -ErrorAction SilentlyContinue


## STEP 2 : Disable services, we cannot stop them, but we can disable them (they won't start next reboot)


Write-Host "    [+] Disable services"

$need_reboot = $false

# WdNisSvc Network Inspection Service 
# WinDefend Antivirus Service
# Sense : Advanced Protection Service

$svc_list = @("WdNisSvc", "WinDefend", "Sense","MpsSvc","mpssvc") #Default WinDefend 2, WdNisSvc  3, Sense 3, MpsSvc 2, mpssvc 2
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" -Name Start -Value 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" -Name Start -Value 2
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Sense" -Name Start -Value 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\MpsSvc" -Name Start -Value 2
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mpssvc" -Name Start -Value 2

Write-Host "    [+] Disable drivers"

# WdnisDrv : Network Inspection System Driver
# wdfilter : Mini-Filter Driver
# wdboot : Boot Driver

$drv_list = @("WdnisDrv", "wdfilter", "wdboot") #Default WdFilter 0, WdBoot 0, WdnisDrv 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdnisDrv" -Name Start -Value 3
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdFilter" -Name Start -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdBoot" -Name Start -Value 0


# Check if service running or not
if($(GET-Service -Name WinDefend).Status -eq "Running") {   
    Write-Host "    [+] WinDefend Service still running (reboot required)"
    $need_reboot = $true
} else {
    Write-Host "    [+] WinDefend Service not running"
}


## STEP 3 : Reboot if needed, add a link to the script to Startup (will be runned again after reboot)


$link_reboot = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\disable-defender.lnk"
Remove-Item -Force "$link_reboot" -ErrorAction 'ignore' # Remove the link (only execute once after reboot)

if($need_reboot) {
    Write-Host "    [+] Please reboot to take effect." -BackgroundColor DarkRed -ForegroundColor White
    
#    $powershell_path = '"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"'
#    $cmdargs = "-ExecutionPolicy Bypass `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
#    
#    $res = New-Item $(Split-Path -Path $link_reboot -Parent) -ItemType Directory -Force
#    $WshShell = New-Object -comObject WScript.Shell
#    $shortcut = $WshShell.CreateShortcut($link_reboot)
#    $shortcut.TargetPath = $powershell_path
#    $shortcut.Arguments = $cmdargs
#    $shortcut.WorkingDirectory = "$(Split-Path -Path $PSScriptRoot -Parent)"
#    $shortcut.Save()

} else {


    ## STEP 4 : After reboot (we checked that everything was successfully disabled), make sure it doesn't come up again !


    if($IsSystem) {

        # Configure the Defender registry to disable it (and the TamperProtection)
        # editing HKLM:\SOFTWARE\Microsoft\Windows Defender\ requires to be SYSTEM

        Write-Host "    [+] Disable all functionnalities with registry keys (SYSTEM privilege)"

        # Cloud-delivered protection:
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -Name SpyNetReporting -Value 2 #default 2
        # Automatic Sample submission
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -Name SubmitSamplesConsent -Value 2 #default 2
        # Tamper protection
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\Features" -Name TamperProtection -Value 5 #default 5
        
        # Disable in registry
		$regwdf_list = @("DisableAntiSpyware", "DisableAntiVirus") #Default DisableAntiVirus 0, DisableAntiSpyware 0
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\" -Name DisableAntiSpyware -Value 0
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender\" -Name DisableAntiVirus -Value 0
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\" -Name DisableAntiSpyware -Value 0
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\" -Name DisableAntiVirus -Value 0
    } else {
        Write-Host "    [W] (Optional) Cannot configure registry (not SYSTEM)"
    }


    if($MyInvocation.UnboundArguments -And $($MyInvocation.UnboundArguments.tolower().Contains("-delete"))) {
        
        # Delete Defender files

        function Delete-Show-Error {
            $path_exists = Test-Path $args[0]
            if($path_exists) {
                Remove-Item -Recurse -Force -Path $args[0]
            } else {
                Write-Host "    [i] $($args[0]) already deleted"
            }
        }
 
        #Write-Host ""
        #Write-Host "[+] Delete Windows Defender (files, services, drivers)"

        # Delete files
        #Delete-Show-Error "C:\ProgramData\Windows\Windows Defender\"
        #Delete-Show-Error "C:\ProgramData\Windows\Windows Defender Advanced Threat Protection\"

        # Delete drivers
        #Delete-Show-Error "C:\Windows\System32\drivers\wd\"

        # Delete service registry entries
        #foreach($svc in $svc_list) {
        #    Delete-Show-Error "HKLM:\SYSTEM\CurrentControlSet\Services\$svc"
        #}

        # Delete drivers registry entries
        #foreach($drv in $drv_list) {
        #    Delete-Show-Error "HKLM:\SYSTEM\CurrentControlSet\Services\$drv"
        #}
		
		Write-Host ""
        Write-Host "[+] Renaming Windows Defender (files, services, drivers)"

        # Rename files
        Rename-Item -Force -Path "C:\ProgramData\Windows\WDF" -NewName "Windows Defender"
        Rename-Item -Force -Path "C:\ProgramData\Windows\WDFATP" -NewName "Windows Defender Advanced Threat Protection"

        # Rename drivers
        Rename-Item -Force -Path  "C:\Windows\System32\drivers\WDFD" -NewName wd
		
        # Rename service registry entries
        foreach($svc in $svc_list) {
            Rename-Item -Force -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$svc.bak" -NewName $svc
        }

        # Rename drivers registry entries
        foreach($drv in $drv_list) {
            Rename-Item -Force -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$drv.bak" -NewName $drv
        }
    }
}

Write-Host ""
Write-Host "Done..."
Write-Host "Please reboot to take effect." -BackgroundColor DarkRed -ForegroundColor White