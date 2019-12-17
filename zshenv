skip_global_compinit=1

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER=most
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export CHEATCOLORS=true

export PATH="$HOME/bin:$PATH"
fpath=(~/.zsh/functions $fpath)

XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls -GFhl -v --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most
alias dirs='dirs -v'
alias cal="gcal -H '\e[34m:\e[0m:\e[32m:\e[0m' -q US_AK"
alias free="free -h"
alias grep="grep --color=auto"
alias df="df -h"
alias dmesg="dmesg -T"

# what the fuck
eval $(thefuck --alias)
