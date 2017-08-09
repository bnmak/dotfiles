skip_global_compinit=1
export TERM=screen-256color

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER=most
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export CHEATCOLORS=true

export GREP_OPTIONS='--color=auto'

# I am going to WAY overcomplicate this...
export GOPATH="$HOME/gocode"
export CAML_LD_LIBRARY_PATH="$HOME/.opam/4.03.0/lib/stublibs:$PATH"
export OCAML_TOPLEVEL_PATH="$HOME/.opam/4.03.0/lib/toplevel:$PATH"
export OCAML_BIN_PATH="$HOME/.opam/4.03.0/bin:$PATH"
export PERL5LIB="$HOME/.opam/4.03.0/lib/perl5"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/usr/local/bin/go/bin:$GOPATH:$PATH"
export PATH="$HOME/.rvm/bin/:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

fpath=(~/.zsh/functions ~/.zsh/completions/ $fpath)

XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls -GFhl --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most
alias dirs='dirs -v'

# what the fuck
eval $(thefuck --alias)

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
