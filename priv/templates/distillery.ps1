<#
#
#>

Param(
   [Parameter(Position=0)]
   [ValidateSet('install','uninstall','start','stop','restart','ping','console','attach','list','usage')]
   [System.String]$Command="usage"
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

function Get-BinaryInPath
{
    param([string]$binaryname)

    $bin = Get-Command $binaryname -ErrorAction SilentlyContinue

    if($bin -ne $null)
    {
	$bin.Definition
    }
    else
    {
	$bin
    }
}

function Get-BinaryInProgramFiles
{
    param([string]$binaryname)
    cd $env:ProgramFiles

    # Can only use Get-ChildItem if binary is in Path.
    $bin = Get-ChildItem $binaryname -ErrorAction SilentlyContinue -Recurse 
    if ($bin -ne $null)
    {
	$bin.Definition
    }
    else
    {
        $bin
    }
}

function Get-BinaryByName
{
    param([string]$binaryname)

    $binInPath = Get-BinaryInPath($binaryname)

    if ($binInPath -eq $null)
    {
	$binInProgramFiles = Get-BinaryInProgramFiles($binaryname)
	if ($binInProgramFiles -eq $null)
	{
	    $binaryNotFound
	}
        else
	{
	    $binInProgramFiles
	}
    }
    else
    {
	$binInPath
    }
}
  
        
function Display-Usage
{
    $scriptName = Split-Path -Path $MyInvocation.ScriptName -Leaf
    Write-Host "usage: $scriptName (install|uninstall|start|stop|restart|upgrade|downgrade|console|ping|list|attach)"
    exit
}

if($Command -eq "usage")
{
    Display-Usage
}
