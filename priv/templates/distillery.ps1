<#
#
#>

Param(
   [Parameter(Position=0)]
   [ValidateSet('install','uninstall','start','stop','restart','ping','console','attach','list','usage')]
   [System.String]$Command
)

write-host "Command: $Command"
