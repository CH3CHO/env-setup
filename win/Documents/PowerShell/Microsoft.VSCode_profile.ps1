$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
oh-my-posh init pwsh --config ~/.oh-my-posh/ch3cho.minimal.json | Invoke-Expression
New-Alias ll ls
New-Alias vi vim
