function Show-Menu
{
    param (
        [string]$Title = 'WINDOWS 10 TWEAKER'
    )
    Clear-Host
    Write-Host "               $Title                 " -BackgroundColor DarkGreen -ForegroundColor White
    Write-Host ""
    Write-Host "     [1]: Remove Bloatware."
    Write-Host "     [2]: Disable Windows Update."
    Write-Host "     [3]: Disable Windows Defender."
    Write-Host "     [4]: Disable Telemetry."
    Write-Host "     [5]: Remove OneDrive."
    Write-Host "     [6]: More Tweaking."
    Write-Host "     [7]: Do All (1-6)."
    Write-Host "     [8]: Enable Windows Update."
    Write-Host "     [Q]: Press 'Q' to quit."
    Write-Host ""
    Write-Host "    D O   W I T H   Y O U R   O W N   R I S K     " -BackgroundColor Red -ForegroundColor Yellow
    Write-Host "Disclaimer : Not guaranteed to catch everything !!" -BackgroundColor DarkGreen -ForegroundColor White
    
}

$Osname = (Get-WmiObject Win32_OperatingSystem).Caption
if($Osname.ToLower().Contains('Windows 10'.ToLower())) {
  do
   {
       Show-Menu
       Write-Host "Your OS : $Osname"
       Write-Host ""
       $selection = Read-Host "Please make a selection"
       switch ($selection)
       {
           '1' {
               $ScriptToRun= $PSScriptRoot+"\remove-debloater.ps1"
               &$ScriptToRun
           } '2' {  
               $ScriptToRun= $PSScriptRoot+"\disable-wupdate.ps1"
               &$ScriptToRun
           } '3' {      
               $ScriptToRun= $PSScriptRoot+"\disable-defender.ps1"
               &$ScriptToRun
           } '4' {
               $ScriptToRun= $PSScriptRoot+"\disable-telemetry.ps1"
               &$ScriptToRun
           } '5' {
               $ScriptToRun= $PSScriptRoot+"\remove-onedrive.ps1"
               &$ScriptToRun
           } '6' {
               $ScriptToRun= $PSScriptRoot+"\Disable-many.ps1"
               &$ScriptToRun
           } '7' {
               $ScriptToRun= $PSScriptRoot+"\remove-debloater.ps1"
               &$ScriptToRun
               Start-Sleep -s 3
               $ScriptToRun= $PSScriptRoot+"\disable-wupdate.ps1"
               &$ScriptToRun
               Start-Sleep -s 3
               $ScriptToRun= $PSScriptRoot+"\disable-defender.ps1"
               &$ScriptToRun
               Start-Sleep -s 3
               $ScriptToRun= $PSScriptRoot+"\disable-telemetry.ps1"
               &$ScriptToRun
               Start-Sleep -s 3
               $ScriptToRun= $PSScriptRoot+"\remove-onedrive.ps1"
               &$ScriptToRun
               Start-Sleep -s 3
               $ScriptToRun= $PSScriptRoot+"\Disable-many.ps1"
               &$ScriptToRun
           } '8' {
               $ScriptToRun= $PSScriptRoot+"\enable-wupdate .ps1"
               &$ScriptToRun
           }
       }
       pause
   }
   until ($selection -eq 'q')
       
} else {
   Clear-Host
   Write-Host 'Not Windows 10... Exiting..'-BackgroundColor Red -ForegroundColor Yellow
   Start-Sleep -s 2
}
