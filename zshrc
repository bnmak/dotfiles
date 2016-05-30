# Set up the prompt and color system
autoload -Uz promptinit && promptinit
autoload -U colors && colors
export TERM=screen-256color

# prompts: left shows current directory in red, right shows current git stuff
PROMPT="%B%{$fg[red]%}%~ > %b%{$reset_color%}"
setopt prompt_subst
source ~/.zshPlugins/git_prompt.zsh

# most is nice
export PAGER=most

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# nice aliases
alias ls='ls -GFhl --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most
alias dirs='dirs -v'

# setup environment stuff
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export GOPATH="/home/brian/gocode"
export PATH="$GOPATH:$PATH"
fpath=(~/.zshCompletions $fpath)

# Load other stuff from external scripts
source /home/brian/.zshPlugins/colored-man.plugin.zsh # colored man pages
source /home/brian/.zshPlugins/history.zsh # Set up history
source /home/brian/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # syntax highlighting
source /home/brian/.zshPlugins/command-not-found.zsh # suggests app to install if command fails
source /home/brian/.zshPlugins/dirstack.zsh # config directory stack

# initialize help system
autoload -U run-help
alias help=run-help

# other options
setopt auto_cd # cd by typing directory name
setopt extendedglob # nicer wildcards
setopt hash_list_all
setopt mark_dirs

# Completion configuration
zmodload zsh/complist
autoload -Uz compinit && compinit
setopt correct
setopt always_to_end
setopt completealiases # complete switches for aliases
setopt nomatch
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=20
eval "$(dircolors -b ~/.dircolors)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle -e ':completion:*' hosts 'reply=()'

# Ignore specific filetypes for certain programs
# Exact instructions here:
# http://unix.stackexchange.com/questions/230742/bash-zsh-tab-autocomplete-given-initial-command-ignore-certain-files-in-direct
# Here, with vim, ignore .(aux|log|pdf) files
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf):source-files' '*:all-files'

fignore=(\~) #ignore these extensions during completion

# Command-line editing
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey '\e.' insert-last-word
bindkey '^w' backward-kill-word

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# Use ctrl-z to toggle back into suspended vim
foreground-vi() {
	fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi
