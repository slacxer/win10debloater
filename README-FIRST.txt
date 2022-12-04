How to run the script :

- Run Powershell As Administrator
- Type command bellow on your powershell
  "Set-ExecutionPolicy Unrestricted -Scope CurrentUser"
- Go to your script directory ( still on Powershell)
- Unblock PowerShell scripts and modules within your script directory by typing:
  "ls -Recurse *.ps*1 | Unblock-File"
- You can run invidual script or by menu
- Use "./Menu.ps1" to run CLI menu or use "./MainMenuGUI.ps1" to run GUI menu