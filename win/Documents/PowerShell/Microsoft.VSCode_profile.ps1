$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
oh-my-posh init pwsh --config ~/.oh-my-posh/ch3cho.minimal.json | Invoke-Expression
Set-Alias ll ls
Set-Alias vi vim
Import-Module posh-git
$Policy = Get-ExecutionPolicy
Set-ExecutionPolicy Bypass -Scope Process
. "$(Split-Path -Path $PROFILE)\kubectl_aliases.ps1"
Set-ExecutionPolicy $Policy -Scope Process