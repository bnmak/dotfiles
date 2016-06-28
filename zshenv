skip_global_compinit=1
export TERM=screen-256color

# Locale settings
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# most is nice
export PAGER=most

# setup environment stuff
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export GOPATH="/home/brian/gocode"
export PATH="$HOME/.local/bin:$GOPATH:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
fpath=(~/.zsh/functions $fpath)

# nice aliases
alias ls='ls -GFhl --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most
alias dirs='dirs -v'

# some other stuff
export CHEATCOLORS=true
