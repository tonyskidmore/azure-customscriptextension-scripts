Write-Host "Installing PowerShell Core..."
Invoke-WebRequest -Uri https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi -OutFile .\PowerShell-7.4.0-win-x64.msi
Start-Process msiexec.exe -Wait -ArgumentList '/package PowerShell-7.4.0-win-x64.msi /L*V "C:\WindowsAzure\Logs\Install-Pwsh.log" /quiet REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1'
Remove-Item .\PowerShell-7.4.0-win-x64.msi