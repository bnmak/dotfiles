# custom path
fpath=(~/.zshCompletion $fpath)

# Set up the prompt and color system
autoload -Uz promptinit && promptinit
autoload -U colors && colors

export TERM=screen-256color
export PAGER=most

# a nice prompt: current directory in red
PROMPT="%B%{$fg[red]%}%~ > %b%{$reset_color%}"

# Use emacs keybindings even if our EDITR is set to vi
bindkey -e

# nice aliases
alias ls='ls -GFhl --literal --color=auto --hide-control-chars --group-directories-first'
alias more=most # most is nicer than more

# Load stuff from external scripts
source /home/brian/.zshPlugins/colored-man.plugin.zsh # colored man pages
# source /home/brian/.zshPlugins/dirstack.zsh # Directory stack config
source /home/brian/.zshPlugins/history.zsh # Set up history
source /home/brian/.zshPlugins/zsh-syntax-highlighting.zsh # syntax highlighting

# initialize help system
autoload -U run-help
alias help=run-help

# options
setopt auto_cd # cd by typing directory name
setopt extendedglob # nicer wildcards

# Completion setup
autoload -Uz compinit && compinit
setopt correct # spelling correction for commands
setopt correct_all # spelling correction for arguments
setopt always_to_end # when completing from middle of word, move cursor to end
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=20
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

fignore=(\~) #ignore these extensions during completiom

# Enable Ctrl-x-e to edit command line and designate Emacs as the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

export EDITOR="vim"
export GREP_OPTIONS='--color=auto' # colorize grep

bindkey '\e.' insert-last-word # alt-. inserts the last word from the previous history event at the cursor position
bindkey '\ex' undefined-key # free key up for tmux
bindkey '^w' backward-kill-word

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)