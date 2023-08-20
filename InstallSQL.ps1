Write-Output "Downloading SQL 2017 Developer Edition"
Invoke-WebRequest -UseBasicParsing https://download.microsoft.com/download/5/A/7/5A7065A2-C81C-4A31-9972-8A31AC9388C1/SQLServer2017-SSEI-Dev.exe -Outfile SQLServer2017-SSEI-Dev.exe

Write-Output "Running SQL 2017 Developer Edition Installer"
./SQLServer2017-SSEI-Dev.exe /ConfigurationFile=.\configuration.ini /IAcceptSqlServerLicenseTerms=True /MediaPath=C:\SetupMedia /Quiet /HideProgressBar
