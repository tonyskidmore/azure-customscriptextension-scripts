Start-Transcript -Path C:\ProgramData\InstallSQL.log -Append
Invoke-WebRequest -UseBasicParsing https://download.microsoft.com/download/5/A/7/5A7065A2-C81C-4A31-9972-8A31AC9388C1/SQLServer2017-SSEI-Dev.exe -Outfile SQLServer2017-SSEI-Dev.exe

./SQLServer2017-SSEI-Dev.exe /ConfigurationFile=.\configuration.ini /IAcceptSqlServerLicenseTerms=True /MediaPath=C:\SetupMedia /Quiet /HideProgressBar

Stop-Transcript
