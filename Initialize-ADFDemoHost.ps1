$urls = @(
    'https://raw.githubusercontent.com/tonyskidmore/azure-customscriptextension-scripts/main/ConfigureRemotingForAnsible.ps1'
)

# Get the temp path
$tempPath = [System.IO.Path]::GetTempPath()

# Create a unique directory name
$tempDir = Join-Path $tempPath ([System.Guid]::NewGuid().ToString())

# Create the directory
New-Item -Path $tempDir -ItemType Directory

foreach ($url in $urls) {
    $output = "$tempDir\$(Split-Path -Path $url -Leaf)"
    Invoke-WebRequest -Uri $url -OutFile $output
    Invoke-Expression -Command $output
}