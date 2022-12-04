<#
$EnableEdgePDFTakeover.Text = "Enable Edge PDF Takeover"
$EnableEdgePDFTakeover.Width = 185
$EnableEdgePDFTakeover.Height = 35
$EnableEdgePDFTakeover.Location = New-Object System.Drawing.Point(155, 260)

#>

#This will self elevate the script so with a UAC prompt since this script needs to be run as an Administrator in order to function properly.

$ErrorActionPreference = 'SilentlyContinue'

$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?

        Select "Yes" to Run as an Administrator

        Select "No" to not run this as an Administrator
        
        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco) 
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}



# This form was created using POSHGUI.com  a free online gui designer for PowerShell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(500,610)
$Form.StartPosition              = 'CenterScreen'
$Form.FormBorderStyle            = 'FixedSingle'
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.ShowIcon                   = $false
$Form.text                       = "Windows 10 (Mungkin Juga 11) Debloater"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#1f4d00")

$DebloatPanel                    = New-Object system.Windows.Forms.Panel
$DebloatPanel.height             = 120
$DebloatPanel.width              = 480
$DebloatPanel.Anchor             = 'top,right,left'
$DebloatPanel.location           = New-Object System.Drawing.Point(10,10)

$WUpdatePanel                   = New-Object system.Windows.Forms.Panel
$WUpdatePanel.height            = 120
$WUpdatePanel.width             = 170
$WUpdatePanel.Anchor            = 'top,right,left'
$WUpdatePanel.location          = New-Object System.Drawing.Point(5,140)

$DFPanel          	            = New-Object system.Windows.Forms.Panel
$DFPanel.height                 = 120
$DFPanel.width                  = 170
$DFPanel.Anchor                 = 'top,right,left'
$DFPanel.location               = New-Object System.Drawing.Point(170,140)

$CortanaPanel                    = New-Object system.Windows.Forms.Panel
$CortanaPanel.height             = 120
$CortanaPanel.width              = 170
$CortanaPanel.Anchor             = 'top,right,left'
$CortanaPanel.location           = New-Object System.Drawing.Point(5,270)

$DRPanel          	            = New-Object system.Windows.Forms.Panel
$DRPanel.height                 = 120
$DRPanel.width                  = 170
$DRPanel.Anchor                 = 'top,right,left'
$DRPanel.location               = New-Object System.Drawing.Point(170,270)

$EdgePanel                       = New-Object system.Windows.Forms.Panel
$EdgePanel.height                = 120
$EdgePanel.width                 = 154
$EdgePanel.Anchor                = 'top,right,left'
$EdgePanel.location              = New-Object System.Drawing.Point(350,270)

$DarkThemePanel                  = New-Object system.Windows.Forms.Panel
$DarkThemePanel.height           = 120
$DarkThemePanel.width            = 153
$DarkThemePanel.Anchor           = 'top,right,left'
$DarkThemePanel.location         = New-Object System.Drawing.Point(350,140)

$OtherPanel                      = New-Object system.Windows.Forms.Panel
$OtherPanel.height               = 160
$OtherPanel.width                = 480
$OtherPanel.Anchor               = 'top,right,left'
$OtherPanel.location             = New-Object System.Drawing.Point(10,400)

$DiscPanel                    = New-Object system.Windows.Forms.Panel
$DiscPanel.height             = 50
$DiscPanel.width              = 480
$DiscPanel.Anchor             = 'top,right,left'
$DiscPanel.location           = New-Object System.Drawing.Point(10,550)

$Debloat                         = New-Object system.Windows.Forms.Label
$Debloat.text                    = "DEBLOAT OPTIONS"
$Debloat.AutoSize                = $true
$Debloat.width                   = 457
$Debloat.height                  = 142
$Debloat.Anchor                  = 'top,right,left'
$Debloat.location                = New-Object System.Drawing.Point(10,9)
$Debloat.Font                    = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Debloat.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$RemoveAllBloatware              = New-Object system.Windows.Forms.Button
$RemoveAllBloatware.FlatStyle    = 'Flat'
$RemoveAllBloatware.text         = "REMOVE ALL BLOATWARE"
$RemoveAllBloatware.width        = 460
$RemoveAllBloatware.height       = 30
$RemoveAllBloatware.Anchor       = 'top,right,left'
$RemoveAllBloatware.location     = New-Object System.Drawing.Point(10,40)
$RemoveAllBloatware.Font         = New-Object System.Drawing.Font('Consolas',9)
$RemoveAllBloatware.ForeColor    = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$RemoveStore                 = New-Object system.Windows.Forms.Button
$RemoveStore.FlatStyle       = 'Flat'
$RemoveStore.text            = "REMOVE MICROSOFT STORE"
$RemoveStore.width           = 225
$RemoveStore.height          = 30
$RemoveStore.Anchor          = 'top,right,left'
$RemoveStore.location        = New-Object System.Drawing.Point(10,40)
$RemoveStore.Font            = New-Object System.Drawing.Font('Consolas',9)
$RemoveStore.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DFender                        = New-Object system.Windows.Forms.Label
$DFender.text                   = "WIN DEFENDER"
$DFender.AutoSize               = $true
$DFender.width                  = 145
$DFender.height                 = 30
$DFender.Anchor                 = 'top,right,left'
$DFender.location               = New-Object System.Drawing.Point(20,10)
$DFender.Font                   = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$DFender.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableDF             		 = New-Object system.Windows.Forms.Button
$DisableDF.FlatStyle  		 = 'Flat'
$DisableDF.text      	 	 = "DISABLE"
$DisableDF.width      		 = 133
$DisableDF.height     		 = 30
$DisableDF.Anchor     		 = 'top,right,left'
$DisableDF.location   		 = New-Object System.Drawing.Point(25,80)
$DisableDF.Font       		 = New-Object System.Drawing.Font('Consolas',9)
$DisableDF.ForeColor  		 = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableDF                    = New-Object system.Windows.Forms.Button
$EnableDF.FlatStyle          = 'Flat'
$EnableDF.text               = "ENABLE"
$EnableDF.width              = 133
$EnableDF.height             = 30
$EnableDF.Anchor             = 'top,right,left'
$EnableDF.location           = New-Object System.Drawing.Point(25,40)
$EnableDF.Font               = New-Object System.Drawing.Font('Consolas',9)
$EnableDF.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$WUpdate                        = New-Object system.Windows.Forms.Label
$WUpdate.text                   = "WIN UPDATE"
$WUpdate.AutoSize               = $true
$WUpdate.width                  = 145
$WUpdate.height                 = 30
$WUpdate.Anchor                 = 'top,right,left'
$WUpdate.location               = New-Object System.Drawing.Point(30,10)
$WUpdate.Font                   = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$WUpdate.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableWU             		 = New-Object system.Windows.Forms.Button
$DisableWU.FlatStyle  		 = 'Flat'
$DisableWU.text      	 	 = "DISABLE"
$DisableWU.width      		 = 133
$DisableWU.height     		 = 30
$DisableWU.Anchor     		 = 'top,right,left'
$DisableWU.location   		 = New-Object System.Drawing.Point(25,80)
$DisableWU.Font       		 = New-Object System.Drawing.Font('Consolas',9)
$DisableWU.ForeColor  		 = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableWU                    = New-Object system.Windows.Forms.Button
$EnableWU.FlatStyle          = 'Flat'
$EnableWU.text               = "ENABLE"
$EnableWU.width              = 133
$EnableWU.height             = 30
$EnableWU.Anchor             = 'top,right,left'
$EnableWU.location           = New-Object System.Drawing.Point(25,40)
$EnableWU.Font               = New-Object System.Drawing.Font('Consolas',9)
$EnableWU.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$Cortana                         = New-Object system.Windows.Forms.Label
$Cortana.text                    = "CORTANA"
$Cortana.AutoSize                = $true
$Cortana.width                   = 457
$Cortana.height                  = 142
$Cortana.Anchor                  = 'top,right,left'
$Cortana.location                = New-Object System.Drawing.Point(45,10)
$Cortana.Font                    = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Cortana.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableCortana                   = New-Object system.Windows.Forms.Button
$EnableCortana.FlatStyle         = 'Flat'
$EnableCortana.text              = "ENABLE"
$EnableCortana.width             = 133
$EnableCortana.height            = 30
$EnableCortana.Anchor            = 'top,right,left'
$EnableCortana.location          = New-Object System.Drawing.Point(25,40)
$EnableCortana.Font              = New-Object System.Drawing.Font('Consolas',9)
$EnableCortana.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableCortana                  = New-Object system.Windows.Forms.Button
$DisableCortana.FlatStyle        = 'Flat'
$DisableCortana.text             = "DISABLE"
$DisableCortana.width            = 133
$DisableCortana.height           = 30
$DisableCortana.Anchor           = 'top,right,left'
$DisableCortana.location         = New-Object System.Drawing.Point(25,80)
$DisableCortana.Font             = New-Object System.Drawing.Font('Consolas',9)
$DisableCortana.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DriverWU                        = New-Object system.Windows.Forms.Label
$DriverWU.text                   = "DRIVER VIA WU"
$DriverWU.AutoSize               = $true
$DriverWU.width                  = 145
$DriverWU.height                 = 30
$DriverWU.Anchor                 = 'top,right,left'
$DriverWU.location               = New-Object System.Drawing.Point(15,10)
$DriverWU.Font                   = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$DriverWU.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableDRWU             		 = New-Object system.Windows.Forms.Button
$DisableDRWU.FlatStyle  	  	 = 'Flat'
$DisableDRWU.text      	    	 = "DISABLE"
$DisableDRWU.width      		 = 133
$DisableDRWU.height     		 = 30
$DisableDRWU.Anchor     		 = 'top,right,left'
$DisableDRWU.location   		 = New-Object System.Drawing.Point(25,80)
$DisableDRWU.Font       		 = New-Object System.Drawing.Font('Consolas',9)
$DisableDRWU.ForeColor  		 = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableDRWU                    = New-Object system.Windows.Forms.Button
$EnableDRWU.FlatStyle          = 'Flat'
$EnableDRWU.text               = "ENABLE"
$EnableDRWU.width              = 133
$EnableDRWU.height             = 30
$EnableDRWU.Anchor             = 'top,right,left'
$EnableDRWU.location           = New-Object System.Drawing.Point(25,40)
$EnableDRWU.Font               = New-Object System.Drawing.Font('Consolas',9)
$EnableDRWU.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$Edge                            = New-Object system.Windows.Forms.Label
$Edge.text                       = "EDGE PDF"
$Edge.AutoSize                   = $true
$Edge.width                      = 457
$Edge.height                     = 142
$Edge.Anchor                     = 'top,right,left'
$Edge.location                   = New-Object System.Drawing.Point(20,10)
$Edge.Font                       = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Edge.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableEdgePDFTakeover           = New-Object system.Windows.Forms.Button
$EnableEdgePDFTakeover.FlatStyle = 'Flat'
$EnableEdgePDFTakeover.text      = "ENABLE"
$EnableEdgePDFTakeover.width     = 134
$EnableEdgePDFTakeover.height    = 30
$EnableEdgePDFTakeover.Anchor    = 'top,right,left'
$EnableEdgePDFTakeover.location  = New-Object System.Drawing.Point(10,40)
$EnableEdgePDFTakeover.Font      = New-Object System.Drawing.Font('Consolas',9)
$EnableEdgePDFTakeover.ForeColor  = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableEdgePDFTakeover             = New-Object system.Windows.Forms.Button
$DisableEdgePDFTakeover.FlatStyle   = 'Flat'
$DisableEdgePDFTakeover.text        = "DISABLE"
$DisableEdgePDFTakeover.width       = 134
$DisableEdgePDFTakeover.height      = 30
$DisableEdgePDFTakeover.Anchor      = 'top,right,left'
$DisableEdgePDFTakeover.location    = New-Object System.Drawing.Point(10,80)
$DisableEdgePDFTakeover.Font        = New-Object System.Drawing.Font('Consolas',9)
$DisableEdgePDFTakeover.ForeColor   = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$Theme                           = New-Object system.Windows.Forms.Label
$Theme.text                      = "DARK THEME"
$Theme.AutoSize                  = $true
$Theme.width                     = 457
$Theme.height                    = 142
$Theme.Anchor                    = 'top,right,left'
$Theme.location                  = New-Object System.Drawing.Point(20,10)
$Theme.Font                      = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Theme.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$EnableDarkMode                  = New-Object system.Windows.Forms.Button
$EnableDarkMode.FlatStyle        = 'Flat'
$EnableDarkMode.text             = "ENABLE"
$EnableDarkMode.width            = 133
$EnableDarkMode.height           = 30
$EnableDarkMode.Anchor           = 'top,right,left'
$EnableDarkMode.location         = New-Object System.Drawing.Point(10,40)
$EnableDarkMode.Font             = New-Object System.Drawing.Font('Consolas',9)
$EnableDarkMode.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableDarkMode                 = New-Object system.Windows.Forms.Button
$DisableDarkMode.FlatStyle       = 'Flat'
$DisableDarkMode.text            = "DISABLE"
$DisableDarkMode.width           = 133
$DisableDarkMode.height          = 30
$DisableDarkMode.Anchor          = 'top,right,left'
$DisableDarkMode.location        = New-Object System.Drawing.Point(10,80)
$DisableDarkMode.Font            = New-Object System.Drawing.Font('Consolas',9)
$DisableDarkMode.ForeColor       = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$Other                           = New-Object system.Windows.Forms.Label
$Other.text                      = "OTHER CHANGES AND FIXES"
$Other.AutoSize                  = $true
$Other.width                     = 457
$Other.height                    = 142
$Other.Anchor                    = 'top,right,left'
$Other.location                  = New-Object System.Drawing.Point(10,10)
$Other.Font                      = New-Object System.Drawing.Font('Consolas',15,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Other.ForeColor                 = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$RemoveOnedrive                  = New-Object system.Windows.Forms.Button
$RemoveOnedrive.FlatStyle        = 'Flat'
$RemoveOnedrive.text             = "UNINSTALL ONEDRIVE"
$RemoveOnedrive.width            = 225
$RemoveOnedrive.height           = 30
$RemoveOnedrive.Anchor           = 'top,right,left'
$RemoveOnedrive.location         = New-Object System.Drawing.Point(245,80)
$RemoveOnedrive.Font             = New-Object System.Drawing.Font('Consolas',9)
$RemoveOnedrive.ForeColor        = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$UnpinStartMenuTiles             = New-Object system.Windows.Forms.Button
$UnpinStartMenuTiles.FlatStyle   = 'Flat'
$UnpinStartMenuTiles.text        = "UNPIN TILES FROM START MENU"
$UnpinStartMenuTiles.width       = 225
$UnpinStartMenuTiles.height      = 30
$UnpinStartMenuTiles.Anchor      = 'top,right,left'
$UnpinStartMenuTiles.location    = New-Object System.Drawing.Point(245,40)
$UnpinStartMenuTiles.Font        = New-Object System.Drawing.Font('Consolas',9)
$UnpinStartMenuTiles.ForeColor   = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$DisableTelemetry                = New-Object system.Windows.Forms.Button
$DisableTelemetry.FlatStyle      = 'Flat'
$DisableTelemetry.text           = "DISABLE TELEMETRY / TASKS"
$DisableTelemetry.width          = 225
$DisableTelemetry.height         = 30
$DisableTelemetry.Anchor         = 'top,right,left'
$DisableTelemetry.location       = New-Object System.Drawing.Point(10,80)
$DisableTelemetry.Font           = New-Object System.Drawing.Font('Consolas',9)
$DisableTelemetry.ForeColor      = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$RemoveRegkeys                   = New-Object system.Windows.Forms.Button
$RemoveRegkeys.FlatStyle         = 'Flat'
$RemoveRegkeys.text              = "REMOVE BLOATWARE REGKEYS"
$RemoveRegkeys.width             = 460
$RemoveRegkeys.height            = 30
$RemoveRegkeys.Anchor            = 'top,right,left'
$RemoveRegkeys.location          = New-Object System.Drawing.Point(10,80)
$RemoveRegkeys.Font              = New-Object System.Drawing.Font('Consolas',9)
$RemoveRegkeys.ForeColor         = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$InstallNet35                    = New-Object system.Windows.Forms.Button
$InstallNet35.FlatStyle          = 'Flat'
$InstallNet35.text               = "INSTALL .NET V3.5"
$InstallNet35.width              = 460
$InstallNet35.height             = 30
$InstallNet35.Anchor             = 'top,right,left'
$InstallNet35.location           = New-Object System.Drawing.Point(10,120)
$InstallNet35.Font               = New-Object System.Drawing.Font('Consolas',9)
$InstallNet35.ForeColor          = [System.Drawing.ColorTranslator]::FromHtml("#eeeeee")

$Disc                        = New-Object system.Windows.Forms.Label
$Disc.text                   = "Disclaimer : Not guaranteed to catch everything !!"
$Disc.AutoSize               = $true
$Disc.width                  = 460
$Disc.height                 = 20
$Disc.Anchor                 = 'top,right,left'
$Disc.location               = New-Object System.Drawing.Point(30,10)
$Disc.Font                   = New-Object System.Drawing.Font('Consolas',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Disc.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#f0d800")

$DWYOR                        = New-Object system.Windows.Forms.Label
$DWYOR.text                   = "D O   W I T H   Y O U R   O W N   R I S K"
$DWYOR.AutoSize               = $true
$DWYOR.width                  = 460
$DWYOR.height                 = 20
$DWYOR.Anchor                 = 'top,right,left'
$DWYOR.location               = New-Object System.Drawing.Point(60,30)
$DWYOR.Font                   = New-Object System.Drawing.Font('Consolas',11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$DWYOR.ForeColor              = [System.Drawing.ColorTranslator]::FromHtml("#f00000")

$Form.controls.AddRange(@($DRPanel,$DFPanel,$WUpdatePanel,$DebloatPanel,$CortanaPanel,$EdgePanel,$DarkThemePanel,$OtherPanel,$DiscPanel))
$DebloatPanel.controls.AddRange(@($Debloat,$RemoveAllBloatware,$RemoveRegkeys))
$WUpdatePanel.controls.AddRange(@($WUpdate,$EnableWU,$DisableWU))
$DFPanel.controls.AddRange(@($DFender,$EnableDF,$DisableDF))
$CortanaPanel.controls.AddRange(@($Cortana,$EnableCortana,$DisableCortana))
$DRPanel.controls.AddRange(@($DriverWU,$EnableDRWU,$DisableDRWU))
$EdgePanel.controls.AddRange(@($EnableEdgePDFTakeover,$DisableEdgePDFTakeover,$Edge))
$DarkThemePanel.controls.AddRange(@($Theme,$DisableDarkMode,$EnableDarkMode))
$OtherPanel.controls.AddRange(@($Other,$RemoveOnedrive,$InstallNet35,$UnpinStartMenuTiles,$DisableTelemetry,$RemoveStore))
$DiscPanel.controls.AddRange(@($Disc,$DWYOR))

$DebloatFolder = "C:\Temp\Windows10Debloater"
If (Test-Path $DebloatFolder) {
    Write-Host "${DebloatFolder} exists. Skipping."
}
Else {
    Write-Host "The folder ${DebloatFolder} doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "${DebloatFolder}" -ItemType Directory
    Write-Host "The folder ${DebloatFolder} was successfully created."
}

Start-Transcript -OutputDirectory "${DebloatFolder}"

Write-Output "Creating System Restore Point if one does not already exist. If one does, then you will receive a warning. Please wait..."
Checkpoint-Computer -Description "Before using W10DebloaterGUI.ps1" 


#region gui events {
$DisableWU.Add_Click( {
        $ErrorActionPreference = 'SilentlyContinue'
        $ScriptToRun= $PSScriptRoot+"\disable-wupdate.ps1"
        &$ScriptToRun
    })

$EnableWU.Add_Click( {
        $ErrorActionPreference = 'SilentlyContinue'
        $ScriptToRun= $PSScriptRoot+"\enable-wupdate.ps1"
        &$ScriptToRun
    })

$DisableDF.Add_Click( { 
       $ErrorActionPreference = 'SilentlyContinue'
       $ScriptToRun= $PSScriptRoot+"\disable-defender.ps1"
       &$ScriptToRun
    })

$EnableDF.Add_Click( { 
       $ErrorActionPreference = 'SilentlyContinue'
       $ScriptToRun= $PSScriptRoot+"\enable-defender.ps1"
       &$ScriptToRun
    })
	
$DisableDRWU.Add_Click( { 
       $ErrorActionPreference = 'SilentlyContinue'
       $ScriptToRun= $PSScriptRoot+"\disable-driver.ps1"
       &$ScriptToRun
    })

$EnableDRWU.Add_Click( { 
       $ErrorActionPreference = 'SilentlyContinue'
       $ScriptToRun= $PSScriptRoot+"\enable-driver.ps1"
       &$ScriptToRun
    })

$RemoveStore.Add_Click( { 
       $ErrorActionPreference = 'SilentlyContinue'
	   New-FolderForced -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore"
	   Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" "AutoDownload" 2
       Get-AppxPackage *windowsstore* | Remove-AppxPackage
	   # reinstall
	   # Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"}
    })
	
$RemoveAllBloatware.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        
        Function DebloatAll {
            $ScriptToRun= $PSScriptRoot+"\remove-debloater.ps1"
            &$ScriptToRun
        }
  
        #Creates a PSDrive to be able to access the 'HKCR' tree
        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
  
        Function Remove-Keys {         
            #These are the registry keys that it will delete.
          
            $Keys = @(
          
                #Remove Background Tasks
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
          
                #Windows File
                "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
          
                #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
                "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
                "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
                "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
          
                #Scheduled Tasks to delete
                "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
          
                #Windows Protocol Keys
                "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
                "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
                "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
             
                #Windows Share Target
                "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"

		#SkyDrive Pro Context menu
                "HKCR:\AllFilesystemObjects\shell\SPFS.ContextMenu"
            )
      
            #This writes the output of each key it is removing and also removes the keys listed above.
            ForEach ($Key in $Keys) {
                Write-Host "Removing $Key from registry"
                Remove-Item $Key -Recurse
            }
        }
          
        Function Protect-Privacy { 
  
            #Creates a PSDrive to be able to access the 'HKCR' tree
            New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
          
            #Disables Windows Feedback Experience
            Write-Host "Disabling Windows Feedback Experience program"
            $Advertising = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'
            If (Test-Path $Advertising) {
                Set-ItemProperty $Advertising Enabled -Value 0
            }
          
            #Stops Cortana from being used as part of your Windows Search Function
            Write-Host "Stopping Cortana from being used as part of your Windows Search Function"
            $Search = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search'
            If (Test-Path $Search) {
                Set-ItemProperty $Search AllowCortana -Value 0
            }
          
            #Stops the Windows Feedback Experience from sending anonymous data
            Write-Host "Stopping the Windows Feedback Experience program"
            $Period1 = 'HKCU:\Software\Microsoft\Siuf'
            $Period2 = 'HKCU:\Software\Microsoft\Siuf\Rules'
            $Period3 = 'HKCU:\Software\Microsoft\Siuf\Rules\PeriodInNanoSeconds'
            If (!(Test-Path $Period3)) { 
                mkdir $Period1
                mkdir $Period2
                mkdir $Period3
                New-ItemProperty $Period3 PeriodInNanoSeconds -Value 0
            }
                 
            Write-Host "Adding Registry key to prevent bloatware apps from returning"
            #Prevents bloatware applications from returning
            $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
            If (!(Test-Path $registryPath)) {
                Mkdir $registryPath
                New-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1 
            }          
      
            Write-Host "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
            $Holo = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic'    
            If (Test-Path $Holo) {
                Set-ItemProperty $Holo FirstRunSucceeded -Value 0
            }
      
            #Disables live tiles
            Write-Host "Disabling live tiles"
            $Live = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'    
            If (!(Test-Path $Live)) {
                mkdir $Live  
                New-ItemProperty $Live NoTileApplicationNotification -Value 1
            }
      
            #Turns off Data Collection via the AllowTelemtry key by changing it to 0
            Write-Host "Turning off Data Collection"
            $DataCollection = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection'    
            If (Test-Path $DataCollection) {
                Set-ItemProperty $DataCollection AllowTelemetry -Value 0
            }
      
            #Disables People icon on Taskbar
            Write-Host "Disabling People icon on Taskbar"
            $People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
            If (Test-Path $People) {
                Set-ItemProperty $People PeopleBand -Value 0
            }
  
            #Disables suggestions on start menu
            Write-Host "Disabling suggestions on the Start Menu"
            $Suggestions = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'    
            If (Test-Path $Suggestions) {
                Set-ItemProperty $Suggestions SystemPaneSuggestionsEnabled -Value 0
            }
            
            Write-Host "Disabling Bing Search when using Search via the Start Menu"
            $BingSearch = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer'
            If (Test-Path $BingSearch) {
                Set-ItemProperty $BingSearch DisableSearchBoxSuggestions -Value 1
            }
            
            Write-Host "Removing CloudStore from registry if it exists"
            $CloudStore = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore'
            If (Test-Path $CloudStore) {
                Stop-Process Explorer.exe -Force
                Remove-Item $CloudStore -Recurse -Force
                Start-Process Explorer.exe -Wait
            }

  
            #Loads the registry keys/values below into the NTUSER.DAT file which prevents the apps from redownloading. Credit to a60wattfish
            reg load HKU\Default_User C:\Users\Default\NTUSER.DAT
            Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SystemPaneSuggestionsEnabled -Value 0
            Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name PreInstalledAppsEnabled -Value 0
            Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name OemPreInstalledAppsEnabled -Value 0
            reg unload HKU\Default_User
      
            #Disables scheduled tasks that are considered unnecessary 
            Write-Host "Disabling scheduled tasks"
            #Get-ScheduledTask -TaskName XblGameSaveTaskLogon | Disable-ScheduledTask
            Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask
            Get-ScheduledTask -TaskName Consolidator | Disable-ScheduledTask
            Get-ScheduledTask -TaskName UsbCeip | Disable-ScheduledTask
            Get-ScheduledTask -TaskName DmClient | Disable-ScheduledTask
            Get-ScheduledTask -TaskName DmClientOnScenarioDownload | Disable-ScheduledTask
        }

        Function UnpinStart {
            # https://superuser.com/a/1442733
            # Requires -RunAsAdministrator

$START_MENU_LAYOUT = @"
<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
    <LayoutOptions StartTileGroupCellWidth="6" />
    <DefaultLayoutOverride>
        <StartLayoutCollection>
            <defaultlayout:StartLayout GroupCellWidth="6" />
        </StartLayoutCollection>
    </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@

            $layoutFile="C:\Windows\StartMenuLayout.xml"

            #Delete layout file if it already exists
            If(Test-Path $layoutFile)
            {
                Remove-Item $layoutFile
            }

            #Creates the blank layout file
            $START_MENU_LAYOUT | Out-File $layoutFile -Encoding ASCII

            $regAliases = @("HKLM", "HKCU")

            #Assign the start layout and force it to apply with "LockedStartLayout" at both the machine and user level
            foreach ($regAlias in $regAliases){
                $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
                $keyPath = $basePath + "\Explorer" 
                IF(!(Test-Path -Path $keyPath)) { 
                    New-Item -Path $basePath -Name "Explorer"
                }
                Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1
                Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile
            }

            #Restart Explorer, open the start menu (necessary to load the new layout), and give it a few seconds to process
            Stop-Process -name explorer
            Start-Sleep -s 5
            $wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('^{ESCAPE}')
            Start-Sleep -s 5

            #Enable the ability to pin items again by disabling "LockedStartLayout"
            foreach ($regAlias in $regAliases){
                $basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
                $keyPath = $basePath + "\Explorer" 
                Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0
            }

            #Restart Explorer and delete the layout file
            Stop-Process -name explorer

            # Uncomment the next line to make clean start menu default for all new users
            #Import-StartLayout -LayoutPath $layoutFile -MountPath $env:SystemDrive\

            Remove-Item $layoutFile
        }
        
        Function CheckInstallService {
  
            If (Get-Service InstallService | Where-Object { $_.Status -eq "Stopped" }) {  
                Start-Service InstallService
                Set-Service InstallService -StartupType Automatic 
            }
        }
  
        Write-Host "[i] Removing bloatware apps."
        DebloatAll
        Write-Host "[i] Removing leftover bloatware registry keys."
        Remove-Keys
        Write-Host "[i] Stopping telemetry, disabling unneccessary scheduled tasks, and preventing bloatware from returning."
        Protect-Privacy
        Write-Host "[i] Unpinning tiles from the Start Menu."
        UnpinStart
        Write-Host "[i] Finished all tasks. `n"
  
    } )


$DisableCortana.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        Write-Host "Disabling Cortana"
        $Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
        $Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
        $Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
        If (!(Test-Path $Cortana1)) {
            New-Item $Cortana1
        }
        Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 0 
        If (!(Test-Path $Cortana2)) {
            New-Item $Cortana2
        }
        Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 1 
        Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 1 
        If (!(Test-Path $Cortana3)) {
            New-Item $Cortana3
        }
        Set-ItemProperty $Cortana3 HarvestContacts -Value 0
        Write-Host "Cortana has been disabled."
    })
$DisableEdgePDFTakeover.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        #Stops edge from taking over as the default .PDF viewer    
        Write-Host "Stopping Edge from taking over as the default .PDF viewer"
        $NoPDF = "HKCR:\.pdf"
        $NoProgids = "HKCR:\.pdf\OpenWithProgids"
        $NoWithList = "HKCR:\.pdf\OpenWithList" 
        If (!(Get-ItemProperty $NoPDF  NoOpenWith)) {
            New-ItemProperty $NoPDF NoOpenWith 
        }        
        If (!(Get-ItemProperty $NoPDF  NoStaticDefaultVerb)) {
            New-ItemProperty $NoPDF  NoStaticDefaultVerb 
        }        
        If (!(Get-ItemProperty $NoProgids  NoOpenWith)) {
            New-ItemProperty $NoProgids  NoOpenWith 
        }        
        If (!(Get-ItemProperty $NoProgids  NoStaticDefaultVerb)) {
            New-ItemProperty $NoProgids  NoStaticDefaultVerb 
        }        
        If (!(Get-ItemProperty $NoWithList  NoOpenWith)) {
            New-ItemProperty $NoWithList  NoOpenWith
        }        
        If (!(Get-ItemProperty $NoWithList  NoStaticDefaultVerb)) {
            New-ItemProperty $NoWithList  NoStaticDefaultVerb 
        }
            
        #Appends an underscore '_' to the Registry key for Edge
        $Edge = "HKCR:\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723_"
        If (Test-Path $Edge) {
            Set-Item $Edge AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723_ 
        }
        Write-Host "Edge should no longer take over as the default .PDF."
    })
$EnableCortana.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        Write-Host "Re-enabling Cortana"
        $Cortana1 = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
        $Cortana2 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
        $Cortana3 = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
        If (!(Test-Path $Cortana1)) {
            New-Item $Cortana1
        }
        Set-ItemProperty $Cortana1 AcceptedPrivacyPolicy -Value 1 
        If (!(Test-Path $Cortana2)) {
            New-Item $Cortana2
        }
        Set-ItemProperty $Cortana2 RestrictImplicitTextCollection -Value 0 
        Set-ItemProperty $Cortana2 RestrictImplicitInkCollection -Value 0 
        If (!(Test-Path $Cortana3)) {
            New-Item $Cortana3
        }
        Set-ItemProperty $Cortana3 HarvestContacts -Value 1 
        Write-Host "Cortana has been enabled!"
    })
$EnableEdgePDFTakeover.Add_Click( { 
        New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
        $ErrorActionPreference = 'SilentlyContinue'
        Write-Host "Setting Edge back to default"
        $NoPDF = "HKCR:\.pdf"
        $NoProgids = "HKCR:\.pdf\OpenWithProgids"
        $NoWithList = "HKCR:\.pdf\OpenWithList"
        #Sets edge back to default
        If (Get-ItemProperty $NoPDF  NoOpenWith) {
            Remove-ItemProperty $NoPDF  NoOpenWith
        } 
        If (Get-ItemProperty $NoPDF  NoStaticDefaultVerb) {
            Remove-ItemProperty $NoPDF  NoStaticDefaultVerb 
        }       
        If (Get-ItemProperty $NoProgids  NoOpenWith) {
            Remove-ItemProperty $NoProgids  NoOpenWith 
        }        
        If (Get-ItemProperty $NoProgids  NoStaticDefaultVerb) {
            Remove-ItemProperty $NoProgids  NoStaticDefaultVerb 
        }        
        If (Get-ItemProperty $NoWithList  NoOpenWith) {
            Remove-ItemProperty $NoWithList  NoOpenWith
        }    
        If (Get-ItemProperty $NoWithList  NoStaticDefaultVerb) {
            Remove-ItemProperty $NoWithList  NoStaticDefaultVerb
        }
        
        #Removes an underscore '_' from the Registry key for Edge
        $Edge2 = "HKCR:\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723_"
        If (Test-Path $Edge2) {
            Set-Item $Edge2 AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723
        }
        Write-Host "Edge will now be able to be used for .PDF."
    })
$DisableTelemetry.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        #Disables Windows Feedback Experience
        Write-Host "Disabling Windows Feedback Experience program"
        $Advertising = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
        If (Test-Path $Advertising) {
            Set-ItemProperty $Advertising Enabled -Value 0 
        }
            
        #Stops Cortana from being used as part of your Windows Search Function
        Write-Host "Stopping Cortana from being used as part of your Windows Search Function"
        $Search = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        If (Test-Path $Search) {
            Set-ItemProperty $Search AllowCortana -Value 0 
        }

        #Disables Web Search in Start Menu
        Write-Host "Disabling Bing Search in Start Menu"
        $WebSearch = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" BingSearchEnabled -Value 0 
        If (!(Test-Path $WebSearch)) {
            New-Item $WebSearch
        }
        Set-ItemProperty $WebSearch DisableWebSearch -Value 1 
            
        #Stops the Windows Feedback Experience from sending anonymous data
        Write-Host "Stopping the Windows Feedback Experience program"
        $Period = "HKCU:\Software\Microsoft\Siuf\Rules"
        If (!(Test-Path $Period)) { 
            New-Item $Period
        }
        Set-ItemProperty $Period PeriodInNanoSeconds -Value 0 

        #Prevents bloatware applications from returning and removes Start Menu suggestions               
        Write-Host "Adding Registry key to prevent bloatware apps from returning"
        $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        $registryOEM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        If (!(Test-Path $registryPath)) { 
            New-Item $registryPath
        }
        Set-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1 

        If (!(Test-Path $registryOEM)) {
            New-Item $registryOEM
        }
        Set-ItemProperty $registryOEM ContentDeliveryAllowed -Value 0 
        Set-ItemProperty $registryOEM OemPreInstalledAppsEnabled -Value 0 
        Set-ItemProperty $registryOEM PreInstalledAppsEnabled -Value 0 
        Set-ItemProperty $registryOEM PreInstalledAppsEverEnabled -Value 0 
        Set-ItemProperty $registryOEM SilentInstalledAppsEnabled -Value 0 
        Set-ItemProperty $registryOEM SystemPaneSuggestionsEnabled -Value 0          
    
        #Preping mixed Reality Portal for removal    
        Write-Host "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
        $Holo = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic"    
        If (Test-Path $Holo) {
            Set-ItemProperty $Holo  FirstRunSucceeded -Value 0 
        }

        #Disables Wi-fi Sense
        Write-Host "Disabling Wi-Fi Sense"
        $WifiSense1 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
        $WifiSense2 = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
        $WifiSense3 = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
        If (!(Test-Path $WifiSense1)) {
            New-Item $WifiSense1
        }
        Set-ItemProperty $WifiSense1  Value -Value 0 
        If (!(Test-Path $WifiSense2)) {
            New-Item $WifiSense2
        }
        Set-ItemProperty $WifiSense2  Value -Value 0 
        Set-ItemProperty $WifiSense3  AutoConnectAllowedOEM -Value 0 
        
        #Disables live tiles
        Write-Host "Disabling live tiles"
        $Live = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"    
        If (!(Test-Path $Live)) {      
            New-Item $Live
        }
        Set-ItemProperty $Live  NoTileApplicationNotification -Value 1 
        
        #Turns off Data Collection via the AllowTelemtry key by changing it to 0
        Write-Host "Turning off Data Collection"
        $DataCollection1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
        $DataCollection2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        $DataCollection3 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection"    
        If (Test-Path $DataCollection1) {
            Set-ItemProperty $DataCollection1  AllowTelemetry -Value 0 
        }
        If (Test-Path $DataCollection2) {
            Set-ItemProperty $DataCollection2  AllowTelemetry -Value 0 
        }
        If (Test-Path $DataCollection3) {
            Set-ItemProperty $DataCollection3  AllowTelemetry -Value 0 
        }
    
        #Disabling Location Tracking
        Write-Host "Disabling Location Tracking"
        $SensorState = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
        $LocationConfig = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
        If (!(Test-Path $SensorState)) {
            New-Item $SensorState
        }
        Set-ItemProperty $SensorState SensorPermissionState -Value 0 
        If (!(Test-Path $LocationConfig)) {
            New-Item $LocationConfig
        }
        Set-ItemProperty $LocationConfig Status -Value 0 
        
        #Disables People icon on Taskbar
        Write-Host "Disabling People icon on Taskbar"
        $People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
        If (Test-Path $People) {
            Set-ItemProperty $People -Name PeopleBand -Value 0
        } 
        
        #Disables scheduled tasks that are considered unnecessary 
        Write-Host "Disabling scheduled tasks"
        #Get-ScheduledTask XblGameSaveTaskLogon | Disable-ScheduledTask
        Get-ScheduledTask XblGameSaveTask | Disable-ScheduledTask
        Get-ScheduledTask Consolidator | Disable-ScheduledTask
        Get-ScheduledTask UsbCeip | Disable-ScheduledTask
        Get-ScheduledTask DmClient | Disable-ScheduledTask
        Get-ScheduledTask DmClientOnScenarioDownload | Disable-ScheduledTask

        #Write-Host "Uninstalling Telemetry Windows Updates"
        #Uninstalls Some Windows Updates considered to be Telemetry. !WIP!
        #Wusa /Uninstall /KB:3022345 /norestart /quiet
        #Wusa /Uninstall /KB:3068708 /norestart /quiet
        #Wusa /Uninstall /KB:3075249 /norestart /quiet
        #Wusa /Uninstall /KB:3080149 /norestart /quiet        

        Write-Host "Stopping and disabling WAP Push Service"
        #Stop and disable WAP Push Service
        Stop-Service "dmwappushservice"
        Set-Service "dmwappushservice" -StartupType Disabled

        Write-Host "Stopping and disabling Diagnostics Tracking Service"
        #Disabling the Diagnostics Tracking Service
        Stop-Service "DiagTrack"
        Set-Service "DiagTrack" -StartupType Disabled
        Write-Host "Telemetry has been disabled!"
    })
$RemoveRegkeys.Add_Click( { 
        $ErrorActionPreference = 'SilentlyContinue'
        $Keys = @(
            
            New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
            #Remove Background Tasks
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
            
            #Windows File
            "HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            
            #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
            
            #Scheduled Tasks to delete
            "HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe"
            
            #Windows Protocol Keys
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
            "HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy"
               
            #Windows Share Target
            "HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0"
        )
        
        #This writes the output of each key it is removing and also removes the keys listed above.
        ForEach ($Key in $Keys) {
            Write-Host "Removing $Key from registry"
            Remove-Item $Key -Recurse
        }
        Write-Host "Additional bloatware keys have been removed!"
    })
$UnpinStartMenuTiles.Add_Click( {
        #https://superuser.com/questions/1068382/how-to-remove-all-the-tiles-in-the-windows-10-start-menu
        #Unpins all tiles from the Start Menu
        Write-Host "Unpinning all tiles from the start menu"
        (New-Object -Com Shell.Application).
        NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
        Items() |
        % { $_.Verbs() } |
        ? { $_.Name -match 'Un.*pin from Start' } |
        % { $_.DoIt() }
    })

$RemoveOnedrive.Add_Click( { 
        If (Test-Path "$env:USERPROFILE\OneDrive\*") {
            Write-Host "Files found within the OneDrive folder! Checking to see if a folder named OneDriveBackupFiles exists."
            Start-Sleep 1
              
            If (Test-Path "$env:USERPROFILE\Desktop\OneDriveBackupFiles") {
                Write-Host "A folder named OneDriveBackupFiles already exists on your desktop. All files from your OneDrive location will be moved to that folder." 
            }
            else {
                If (!(Test-Path "$env:USERPROFILE\Desktop\OneDriveBackupFiles")) {
                    Write-Host "A folder named OneDriveBackupFiles will be created and will be located on your desktop. All files from your OneDrive location will be located in that folder."
                    New-item -Path "$env:USERPROFILE\Desktop" -Name "OneDriveBackupFiles"-ItemType Directory -Force
                    Write-Host "Successfully created the folder 'OneDriveBackupFiles' on your desktop."
                }
            }
            Start-Sleep 1
            Move-Item -Path "$env:USERPROFILE\OneDrive\*" -Destination "$env:USERPROFILE\Desktop\OneDriveBackupFiles" -Force
            Write-Host "Successfully moved all files/folders from your OneDrive folder to the folder 'OneDriveBackupFiles' on your desktop."
            Start-Sleep 1
            Write-Host "Proceeding with the removal of OneDrive."
            Start-Sleep 1
        }
        Else {
            Write-Host "Either the OneDrive folder does not exist or there are no files to be found in the folder. Proceeding with removal of OneDrive."
            Start-Sleep 1
            Write-Host "Enabling the Group Policy 'Prevent the usage of OneDrive for File Storage'."
            $OneDriveKey = 'HKLM:Software\Policies\Microsoft\Windows\OneDrive'
            If (!(Test-Path $OneDriveKey)) {
                Mkdir $OneDriveKey
                Set-ItemProperty $OneDriveKey -Name OneDrive -Value DisableFileSyncNGSC
            }
            Set-ItemProperty $OneDriveKey -Name OneDrive -Value DisableFileSyncNGSC
        }

        Write-Host "Uninstalling OneDrive. Please wait..."
    
        New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
        $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
        $ExplorerReg1 = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        $ExplorerReg2 = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        Stop-Process -Name "OneDrive*"
        Start-Sleep 2
        If (!(Test-Path $onedrive)) {
            $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
        }
        Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
        Start-Sleep 2
        Write-Host "Stopping explorer"
        Start-Sleep 1
        taskkill.exe /F /IM explorer.exe
        Start-Sleep 3
        Write-Host "Removing leftover files"
        If (Test-Path "$env:USERPROFILE\OneDrive") {
            Remove-Item "$env:USERPROFILE\OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:LOCALAPPDATA\Microsoft\OneDrive") {
            Remove-Item "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:PROGRAMDATA\Microsoft OneDrive") {
            Remove-Item "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse
        }
        If (Test-Path "$env:SYSTEMDRIVE\OneDriveTemp") {
            Remove-Item "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse
        }
        Write-Host "Removing OneDrive from windows explorer"
        If (!(Test-Path $ExplorerReg1)) {
            New-Item $ExplorerReg1
        }
        Set-ItemProperty $ExplorerReg1 System.IsPinnedToNameSpaceTree -Value 0 
        If (!(Test-Path $ExplorerReg2)) {
            New-Item $ExplorerReg2
        }
        Set-ItemProperty $ExplorerReg2 System.IsPinnedToNameSpaceTree -Value 0
        Write-Host "Restarting Explorer that was shut down before."
        Start-Process explorer.exe -NoNewWindow
        Write-Host "OneDrive has been successfully uninstalled!"
        
        Remove-item env:OneDrive
    })

$InstallNet35.Add_Click( {

        Write-Host "Initializing the installation of .NET 3.5..."
        DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
        Write-Host ".NET 3.5 has been successfully installed!"
    } )

$EnableDarkMode.Add_Click( {
        Write-Host "Enabling Dark Mode"
        $Theme = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty $Theme AppsUseLightTheme -Value 0
        Start-Sleep 1
        Write-Host "Enabled"
    }
)

$DisableDarkMode.Add_Click( {
        Write-Host "Disabling Dark Mode"
        $Theme = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Set-ItemProperty $Theme AppsUseLightTheme -Value 1
        Start-Sleep 1
        Write-Host "Disabled"
    }
)

[void]$Form.ShowDialog()
