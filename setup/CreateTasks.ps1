param (
    [Parameter(Mandatory=$true)]
    [string]$scriptpath,
    [Parameter(Mandatory=$true)]
    [string]$sctaskuser,
    [Parameter(Mandatory=$true)]
    [string]$sctaskpw
)

$xmlFiles = Get-ChildItem -Path $scriptpath -Filter *.xml -Recurse

#$rp = ConvertFrom-SecureString -SecureString $sctaskpw -AsPlainText

# Example: Output the full path of each XML file
foreach ($file in $xmlFiles) {
    $currentFolder = Split-Path -Parent $file.FullName
    $leafFolder = Split-Path $currentFolder -Leaf
    $tn = "Github\" + $leafFolder
    schtasks.exe /Create /XML $file.FullName /tn $tn /RU $sctaskuser /RP $sctaskpw /F
}
