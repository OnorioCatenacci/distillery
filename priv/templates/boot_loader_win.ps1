<# Discover the current release directory from the directory
   of this script and the start_erl.data file
#>
$script_dir=$PSScriptRoot
$release_root_dir = Split-Path $script_dir -Parent

$rel_vsn="<%= rel_vsn %>"
$boot_script="$release_root_dir\releases\$rel_vsn\boot_win.ps1"
iex $boot_script $args[0]