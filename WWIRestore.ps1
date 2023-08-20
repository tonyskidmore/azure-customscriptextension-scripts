Invoke-WebRequest -UseBasicParsing https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak -OutFile WideWorldImporters-Full.bak

$server="localhost"
$username="sa"
$password="S00p3rS3cret!"
$databasename="master"
$sqlscript="WWIRestore.sql"

# reload environment variables after SQL install
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

$dummyName = [guid]::NewGuid().ToString()
[Environment]::SetEnvironmentVariable($dummyName, 'foo', 'User')
[Environment]::SetEnvironmentVariable($dummyName, [NullString]::value, 'User')


# Path to the file
$file = 'WWIRestore.sql'

# Read the content of the file
$content = Get-Content -Path $file

# Replace the string "REPLACE_ME" with the current working directory
$content = $content -replace 'REPLACE_ME', $PWD.Path

# Write the updated content back to the file
Set-Content -Path $file -Value $content

& sqlcmd -S $server -U $username -P $password -d $databasename -i $sqlscript
