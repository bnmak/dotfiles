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
export PATH="$HOME/adom/:$HOME/.local/bin:/usr/local/bin/go/bin:$GOPATH:$HOME/.rvm/bin/:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
fpath=(~/.zsh/functions ~/.zsh/completions/ $fpath)

# nice aliases
alias ls='ls -GFhl --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most
alias dirs='dirs -v'

# some other stuff
export CHEATCOLORS=true

# fzf options
export FZF_DEFAULT_OPTS="--ansi" 

# what the fuck
eval $(thefuck --alias)

# ocaml path stuff
# CAML_LD_LIBRARY_PATH="/home/brian/.opam/4.03.0/lib/stublibs"; export CAML_LD_LIBRARY_PATH;
# MANPATH=":/home/brian/.opam/4.03.0/man"; export MANPATH;
# PERL5LIB="/home/brian/.opam/4.03.0/lib/perl5"; export PERL5LIB;
# OCAML_TOPLEVEL_PATH="/home/brian/.opam/4.03.0/lib/toplevel"; export OCAML_TOPLEVEL_PATH;
# PATH="/home/brian/.opam/4.03.0/bin:/home/brian/.local/bin:/home/brian/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

