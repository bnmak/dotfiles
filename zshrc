if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
fi

# Zinit installer block
# Do not alter anything in here
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
# End Zinit installer block

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -e
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' fzf-backward-history
bindkey '$terminfo[kcuu1]' history-substring-search-up
bindkey '$terminfo[kcud1]' history-substring-search-down

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
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# local knownhosts > /dev/null
# knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )

zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf):source-files' '*:all-files'

fignore=(\~) # ignore these extensions during completion

setopt prompt_subst
PROMPT='%B%{$fg[magenta]%}%(1j.%j .)$(shrink_path -f) %B%(?.%{$fg[green]%}.%{$fg[red]%})★ %b%{$reset_color%}'

autoload -U run-help
alias help=run-help

setopt AUTO_CD
setopt CORRECT
setopt EXTENDEDGLOB
setopt HASH_CMDS
setopt IGNOREEOF
setopt LONG_LIST_JOBS
setopt MARK_DIRS
setopt NOCLOBBER

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

autoload -U colors && colors

zmodload zsh/complist
autoload -Uz compinit && compinit
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt COMPLETEALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt NOMATCH
setopt HASH_CMDS

zmodload zsh/terminfo

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

zinit light aloxaf/fzf-tab
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/shrink-path/shrink-path.plugin.zsh
zinit light	wting/autojump

bindkey -e
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' fzf-history-widget
bindkey '$terminfo[kcuu1]' history-substring-search-up
bindkey '$terminfo[kcud1]' history-substring-search-down

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
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf):source-files' '*:all-files'
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# local knownhosts > /dev/null
# knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )


fignore=(\~) # ignore these extensions during completion

setopt prompt_subst
PROMPT='%B%{$fg[magenta]%}%(1j.%j .)$(shrink_path -f) %B%(?.%{$fg[green]%}.%{$fg[red]%})★ %b%{$reset_color%}'

[ -f ~/.zsh/fzf-tab-config.zsh ] && source ~/.zsh/fzf-tab-config.zsh
