autoload -U run-help
autoload -U colors && colors
zmodload zsh/complete
zmodload zsh/complist
zmodload zsh/computil
zmodload zsh/termcap
zmodload zsh/terminfo
zmodload zsh/zutil

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
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh \
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
zinit snippet OMZ::plugins/shrink-path/shrink-path.plugin.zsh \
zinit snippet OMZ::plugins/history-substring-search/history-substring-search.zsh \
zinit light aloxaf/fzf-tab \
zinit light zdharma/fast-syntax-highlighting \
zinit light zsh-users/zsh-history-substring-search \
zinit light zsh-users/zsh-completions

autoload -Uz compinit && compinit

bindkey -e
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' fzf-history-widget
bindkey '^[0A' history-substring-search-up
bindkey '^[0B' history-substring-search-down

zstyle '*' single-ignored complete
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache/
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf):source-files' '*:all-files'

setopt prompt_subst
PROMPT='%B%{$fg[magenta]%}%(1j.%j .)$(shrink_path -f) %B%(?.%{$fg[green]%}.%{$fg[red]%})★ %b%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt AUTO_CD
setopt CHASE_LINKS
setopt ALWAYS_LAST_PROMPT
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt GLOB_COMPLETE
setopt HASH_LIST_ALL
setopt LIST_AMBIGUOUS
setopt LIST_TYPES
setopt MENU_COMPLETE

setopt MARK_DIRS
setopt NOMATCH
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

autoload -Uz compinit && compinit

bindkey -e
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word
bindkey '^r' fzf-history-widget
bindkey '$terminfo[kcuu1]' history-substring-search-up
bindkey '$terminfo[kcud1]' history-substring-search-down
