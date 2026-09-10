Remove-Item Alias:ls -Force

function ls { eza $args }
function lsl { eza -l --header --color=always $args }
function lsa { eza -al --header --color=always $args }
function lsg { eza -l --header --git --git-repos-no-status --color=always $args }
function lst { eza -T --header --color=always $args }
function lsi { eza -l --header --git-ignore --color=always $args }

Invoke-Expression (& { (zoxide init powershell | Out-String) })
