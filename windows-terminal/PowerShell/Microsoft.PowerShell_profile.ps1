Remove-Item Alias:ls -Force

function ls { eza --grid --color=always --group-directories-first $args }
function ll { eza -l --grid --color=always --group-directories-first $args }
function la { eza -al --grid --color=always --group-directories-first $args }
function lt { eza -TL 3 --color=always --group-directories-first $args }

Invoke-Expression (& { (zoxide init powershell | Out-String) })
