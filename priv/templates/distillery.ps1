<#
#
#>

Param(
   [Parameter(Position=0)]
   [ValidateSet('install','uninstall','start','stop','restart','ping','console','attach','list','usage')]
   [System.String]$Command="usage"
)

Set-Variable binaryNotFound -option Constant -value "No binary found"
Set-Variable rel_name -option Constant -value "<%= rel_name %>"
Set-Variable rel_vsn -option Constant -value "<%= rel_vsn %>"
Set-Variable erts_vsn -option Constant -value "<%= erts_vsn %>"
Set-Variable erl_opts  -option Constant -value "<%= erl_opts %>"

function Fix-PathsWithSpaces
{
    param([string] $pathToFix)
    $pathParts = $pathToFix.Split([System.IO.Path]::DirectorySeparatorChar)
    #for each element in array if it contains a space, surround it with double quotes
}

function Set-ReleaseRoot
{
    $script_dir = $PSScriptRoot
    $script_dir
}

function Find-ErtsDir
{
    $release_root = Set-ReleaseRoot
    $possible_erts_dir = "$release_root\erts-$erts_vsn"
    Write-Host "$possible_erts_dir"

}
<#@set possible_erts_dir=%release_root_dir%\erts-%erts_vsn%
@if exist "%possible_erts_dir%" (
  call :set_erts_dir_from_default
) else (
  call :set_erts_dir_from_erl
)
@goto :eof

:: Set the ERTS dir from the passed in erts_vsn
:set_erts_dir_from_default
@set erts_dir=%possible_erts_dir%
@set rootdir=%release_root_dir%
@goto :eof

:: Set the ERTS dir from erl
:set_erts_dir_from_erl
@for /f "delims=" %%i in ('where erl') do @(
  set erl=%%i
)
@set dir_cmd="%erl%" -noshell -eval "io:format(\"~s\", [filename:nativename(code:root_dir())])." -s init stop
@for /f %%i in ('%%dir_cmd%%') do @(
  set erl_root=%%i
)
@set erts_dir=%erl_root%\erts-%erts_vsn%
@set rootdir=%erl_root%
@goto :eof #>


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
