export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export PAGER=most
export EDITOR=vim
export CHEATCOLORS=true
export XDG_CONFIG_HOME="$HOME/.config"

typeset -U path
path=(~/.local/bin ~/bin /usr/local/go/bin ~/.cargo/bin /bin /usr/bin /usr/local/bin /usr/sbin/ $PATH)
export PATH

fpath=(~/.zsh/functions $fpath)

alias ls='ls -GFhl -v --literal --color=always --hide-control-chars --group-directories-first'
alias cal="gcal -H '\e[34m:\e[0m:\e[32m:\e[0m' -q US_AK"
alias free="free -h"
alias grep="grep --color=auto"
alias df="df -h"
alias dmesg="dmesg -T"
alias uptime="uptime -p"
alias more="most"
alias weather="weather panc"
alias yacreader="YACReader"

# what the fuck
eval $(thefuck --alias)
