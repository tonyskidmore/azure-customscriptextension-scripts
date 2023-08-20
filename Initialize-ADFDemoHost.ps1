$urls = @(
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/ConfigureRemotingForAnsible.ps1',
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/configuration.ini',
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/InstallSQL.ps1',
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/WWIRestore.sql',
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/WWIRestore.ps1'
)

# Get the temp path
$tempPath = [System.IO.Path]::GetTempPath()

# Create a unique directory name
$tempDir = Join-Path $tempPath ([System.Guid]::NewGuid().ToString())

# Create the directory
New-Item -Path $tempDir -ItemType Directory
Write-Output "Setting location: $tempDir"
Set-Location -Path $tempDir

foreach ($url in $urls) {
    $output = "$tempDir\$(Split-Path -Path $url -Leaf)"
    Invoke-WebRequest -Uri $url -OutFile $output
    Write-Output "Downloaded $url to $output"
    if($output -like '*.ps1') {
        Write-Output "Executing $output"
        Invoke-Expression -Command $output
    }
}
