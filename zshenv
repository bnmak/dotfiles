export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export PAGER=most
export MANPAGER=most
export EDITOR=nvim
export VISUAL=nvim

export D=~/Downloads
export P=~/000_in_progress
export R=~/111_ready
export C=~/.config
export W=~/w10
export F=~/long_organizational_projects/Fonts

export MAN_POSIXLY_CORRECT=1

export FZF_DEFAULT_OPTS="--info=hidden --no-multi --no-mouse --layout=reverse --border=rounded --ansi --height=45% --margin=10%,25%,25%,1% --black"
# -n FIELD_INDEX_EXPRESSION

typeset -U path PATH
path=( ~/.local/bin
	~/bin
	.gem/ruby/2.7.0/bin
	/bin
	/usr/bin
	/usr/local/bin
	/usr/sbin/
	$PATH )
export PATH

module_path+=( "/home/brian/.zinit/bin/zmodules/Src" )

fpath=( ~/.zsh/functions
	$fpath )

alias df="df -hlT --total"
alias dmesg="dmesg -T"
alias feh="feh -F"
alias free="free -h"
alias grep="grep --color=auto"
alias ll='\ls -hl --color=always --group-directories-first --file-type'
alias ls='ls -N --color=always --group-directories-first -v --file-type'
alias lss='\ls -N --color=always -s -k -h --group-directories-first -v'
alias more="most"
alias uptime="uptime -p"
alias vim-gtk="nvim-gtk"
alias vim="nvim"
alias tdir="mktemp -d"
