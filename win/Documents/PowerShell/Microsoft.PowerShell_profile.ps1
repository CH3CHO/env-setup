$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
oh-my-posh init pwsh --config ~/.oh-my-posh/ch3cho.minimal.json | Invoke-Expression
New-Alias ll ls
New-Alias vi vim
Import-Module posh-git
PowerShell.exe -ExecutionPolicy Bypass -File "$(Split-Path -Path $PROFILE)\kubectl_aliases.ps1"