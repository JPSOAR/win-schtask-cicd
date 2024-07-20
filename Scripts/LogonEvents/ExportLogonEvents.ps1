param (
    [Parameter(Mandatory=$true)]
    [string]$OutputFilePath
)

# Define the output directory based on the provided file path
$OutputDirectory = Split-Path -Path $OutputFilePath -Parent

# Check if the output directory exists and create it if it doesn't
if (-not (Test-Path -Path $OutputDirectory)) {
    New-Item -Path $OutputDirectory -ItemType Directory
}

# Define the time range (last 10 days)
$StartDate = (Get-Date).AddDays(-10)

# Get logon events (Event ID 4624) from the Security log
$LogonEvents = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4624
    StartTime = $StartDate
} | Select-Object TimeCreated, @{Name="User";Expression={$_.Properties[5].Value}}, @{Name="LogonType";Expression={$_.Properties[8].Value}}, @{Name="IpAddress";Expression={$_.Properties[18].Value}}

# Convert to CSV and export
$LogonEvents | Export-Csv -Path $OutputFilePath -NoTypeInformation

Write-Output "Logon events exported to $OutputFilePath"
