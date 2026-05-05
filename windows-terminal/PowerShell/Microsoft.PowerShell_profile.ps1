Remove-Item Alias:ls -Force

function ls { eza --grid --color=always --group-directories-first $args }
function ll { eza -l --grid --color=always --group-directories-first $args }
function la { eza -al --grid --color=always --group-directories-first $args }
function lt { eza -aTL 3 --color=always --group-directories-first $args }
function lT { eza -aT --color=always --group-directories-first $args }

jj util completion power-shell | Out-String | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })
