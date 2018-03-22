# TMUX
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
fi

autoload -U colors && colors
setopt prompt_subst
PROMPT='%B%{$fg[magenta]%}%(1j.%j .)%~ %B%(?.%{$fg[green]%}.%{$fg[red]%})$(git_super_status)★ %b%{$reset_color%}'

# plugins
source ~/.zsh/zsh_plugins.zsh
#source <(antibody init)
#antibody bundle < ~/.zsh/plugins.txt

# help system
autoload -U run-help
alias help=run-help

# some options
setopt AUTO_CD
setopt CORRECTALL
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
autoload -Uz compinit && compinit
zmodload zsh/complist
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt COMPLETEALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt NOMATCH
setopt HASH_CMDS

eval "$(dircolors -b ~/.dircolors)"
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

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

autoload -U zmv # this is so nice
autoload -U up # easier navigation

# keybindings and related
bindkey -e # emacs keybinding
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-pattern-search-backward
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# directory stack
DIRSTACKSIZE=9
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

PATH="/home/brian/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/brian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/brian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/brian/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/brian/perl5"; export PERL_MM_OPT;
