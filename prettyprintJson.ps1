# Description: Convert JSON file to a pretty-printed JSON string
# Usage: ConvertFrom-JsonFile -FileName <filename>
# Example: ConvertFrom-JsonFile -FileName .\jsonexample.json
function ConvertFrom-JsonFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FileName
    )

    Get-Content $FileName | ConvertFrom-Json | ConvertTo-Json -Depth 100
}

# Using args[0] to get the filename from command line and not a named param
# Example usage:
if ($args.Count -eq 1) {
    # ConvertFrom-JsonFile -FileName $args[0]
    jq -C . $args[0]
}
else {
    Write-Host "Usage: ConvertFrom-JsonFile -FileName <filename>"
}
# pwsh -Command '& { param([string]$fileName) $data = Get-Content -Path $fileName; $data | ConvertFrom-Json | ConvertTo-Json -Depth 100 }' '.\jsonexample.json'