<#
#
#>

Param(
   [Parameter(Position=0)]
   [ValidateSet('install','uninstall','start','stop','restart','ping','console','attach','list','usage')]
   [System.String]$Command
)

function Get-ServiceByName
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
    $bin = Get-Command $binaryname -ErrorAction SilentlyContinue
}
  
        
write-host "Command: $Command"
