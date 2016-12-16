# prompt
autoload -Uz promptinit && promptinit
autoload -U colors && colors
setopt prompt_subst
PROMPT='%B%{$fg[yellow]%}%~ %B%(?.%{$fg[yellow]%}.%{$fg[red]%})> %b%{$reset_color%}'
source ~/.zsh/git_prompt.zsh

# plugins
source $HOME/git/antigen/antigen.zsh
antigen bundle chrissicool/zsh-256color
antigen bundle hcgraf/zsh-sudo
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
antigen bundle robbyrussell/oh-my-zsh plugins/command-not-found
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen apply

# other external stuff
source $HOME/.zsh/bindings.zsh
source $HOME/.zsh/dirstack.zsh
source $HOME/.zsh/history.zsh

# help system
autoload -U run-help
alias help=run-help

# other options
setopt auto_cd
setopt extendedglob
setopt hash_list_all
setopt mark_dirs

# completion
zmodload zsh/complist
autoload -Uz compinit && compinit
setopt correct
setopt always_to_end
setopt completealiases # complete switches for aliases
setopt complete_in_word
setopt nomatch
eval "$(dircolors -b ~/.dircolors)"
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=20
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts

# Ignore specific filetypes for certain programs
# http://unix.stackexchange.com/questions/230742/bash-zsh-tab-autocomplete-given-initial-command-ignore-certain-files-in-direct
# Here, with vim, ignore .(aux|log|pdf) files
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf):source-files' '*:all-files'

# With certain programs, only open specific extensions
# With green, only complete PDFs
zstyle ':completion:*:*:green:*' file-patterns '*.pdf:source-files' '*:all-files'

fignore=(\~) #ignore these extensions during completion

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

autoload -U zmv # this is so nice
autoload -U up # easier navigation

# fuzzy finding
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OPAM configuration
#. /home/brian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
