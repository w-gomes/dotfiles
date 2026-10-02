source /usr/share/cachyos-fish-config/cachyos-config.fish

set fish_greeting

alias vim="nvim"
alias cd='z'
alias ls='eza --icons=always'
alias lsl='eza -l --header --color=always --icons=always'
alias lsa='eza -al --header --color=always --icons=always'
alias lsg='eza -l --header --git --git-repos-no-status --color=always --icons=always'
alias lst='eza -T --header --color=always --icons=always'
alias lsi='eza -l --header --git-ignore --color=always --icons=always'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"


zoxide init fish | source
