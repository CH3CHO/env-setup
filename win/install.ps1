Start http://github.com/PowerShell/PowerShell/releases/latest
Start https://github.com/genzj/pybingwallpaper/releases/latest
Start https://adoptium.net/temurin/releases?version=8
Start https://adoptium.net/temurin/releases?version=11

$WORKING_DISK = "D:\"

Set-ExecutionPolicy RemoteSigned -scope CurrentUser;
$env:SCOOP = $WORKING_DISK + "Tools\scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
iwr -useb get.scoop.sh | iex
scoop update

scoop bucket add extras

scoop install autohotkey
scoop install gsudo
scoop install dnGrep