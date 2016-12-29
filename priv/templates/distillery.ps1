<#
#
#>

Param(
   [Parameter(Position=0)]
   [ValidateSet('install','uninstall','start','stop','restart','ping','console','attach','list','usage')]
   [System.String]$Command
)

Set-Variable binaryNotFound -option Constant -value "No binary found"

function Test-ServiceIsInstalled
{
    param([string]$servicename)
    try
    {
	$svc = Get-Service -Name $servicename -ErrorAction SilentlyContinue
	$svc -ne $null
    }
    catch{$false}
}

function Get-BinaryByName
{
    param([string]$binaryname)
    cd $env:ProgramFiles

    # Can only use Get-ChildItem if binary is in Path.
#    $bin = Get-ChildItem $binaryname -ErrorAction SilentlyContinue 
#    if ($bin -ne $null)
#    {
#	$bin.Definition
#    }
#    else
#    {
#        $binaryNotFound
#    }
}
  
        
