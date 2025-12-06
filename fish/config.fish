source /usr/share/cachyos-fish-config/cachyos-config.fish

alias vim="nvim"
alias cd='z'
alias ls='eza --grid --color=always --group-directories-first --icons'   # grid listing
alias ll='eza -l --color=always --group-directories-first --icons'       # long format
alias la='eza -al --color=always --group-directories-first --icons'      # everything
alias lt='eza -aTL 3 --color=always --group-directories-first --icons'   # tree deep 3
alias lT='eza -aT --color=always --group-directories-first --icons'      # tree everything
alias l.="eza -a | grep -e '^\.'"                                        # show only dotfiles

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"


zoxide init fish | source
