# tmux
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
fi

# plugins
source ~/.zplug/init.zsh
  zplug	"zplug/zplug", hook-build:'zplug --self-manage'
  zplug "Aloxa/fzf-tab"
  zplug "plugins/command-not-found", from:oh-my-zsh
  zplug	"plugins/sudo", from:oh-my-zsh
  zplug "zsh-users/zsh-completions"
  zplug "plugins/shrink-path", from:oh-my-zsh
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "zsh-users/zsh-history-substring-search"
  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "plugins/tmux", from:oh-my-zsh
  zplug	"plugins/ufw", from:oh-my-zsh
  # zplug "dim-an/cod"
  # zplug "djui/alias-tips"
  # zplug	"fcambus/asciiweather"
  # zplug	"wting/autojump"
  # zplug "psprint/zsh-editing-toolkit"
  # zplug	"MikeDacre/tmux-zsh-vim-titles"
  # zplug "lcrespom/oh-my-zsh-history-popup" 
  # zplug "joepvd/zsh-hints"
  zplug	"plugins/safe-paste", from:oh-my-zsh
zplug load

autoload -U colors && colors
setopt prompt_subst
PROMPT='%B%{$fg[magenta]%}%(1j.%j .)$(shrink_path -f) %B%(?.%{$fg[green]%}.%{$fg[red]%})★ %b%{$reset_color%}'

# help system
autoload -U run-help
alias help=run-help

# some options
setopt AUTO_CD
setopt CORRECT
setopt EXTENDEDGLOB
setopt HASH_CMDS
setopt IGNOREEOF
setopt LONG_LIST_JOBS
setopt MARK_DIRS
setopt NOCLOBBER

# history options
setopt APPEND_HISTORY
setopt AUTO_PUSHD
setopt AUTO_RESUME
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHAREHISTORY
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# completion setup
zmodload zsh/complist
autoload -Uz compinit && compinit
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt COMPLETEALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt NOMATCH
setopt HASH_CMDS

zstyle '*' single-ignored complete
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache/
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=20
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
local knownhosts > /dev/null
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

eval "$(dircolors -b ~/.dircolors)"

autoload -U zmv # this is so nice

# keybindings
zmodload zsh/terminfo
bindkey -e # emacs keybinding
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-pattern-search-backward
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

# IMPORTANT! Fixes zplug job control problems
set -o monitor

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH="/home/brian/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/brian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/brian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/brian/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/brian/perl5"; export PERL_MM_OPT;
