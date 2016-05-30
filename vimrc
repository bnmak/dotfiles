" This must be first, because it changes other options as a side effect
set nocompatible

set hidden " It hides buffers instead of closing them. This means that you can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.

" color stuff
set t_Co=256
syntax on
set background=dark
colorscheme ron

" pathogen stuff
call pathogen#helptags()
call pathogen#infect()

" general configuration options
set backspace=indent,eol,start " allow backspacing over everything
set encoding=utf8	  " explains itself
set ffs=unix,dos,mac  " set Unix as standard filetype
set backup		      " keep a backup file
set tabstop=4         " tab is four spaces
set shiftwidth=4	  " autoinsert tab is small
set smarttab		  " start of line tabs based on shiftwidth
set history=50		  " keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		      " display incomplete commands
set incsearch		  " do incremental searching
set nohlsearch        " do not highlight search terms
set backupdir=~/.vim/.backup  " backup location
set directory=~/tmp   " swap file location
set modelines=0       " security hole!
set wildmenu          " nice completion
set wildmode=longest,list,full " configure this menu
set showmatch         " show matching parens
set smartcase         " ignore case when searching if pattern is all lowercase, otherwise case-sensitive
set visualbell        " don't beep
set mps+=<:>          " also match these when using % to jump between

filetype plugin on
filetype indent on

" line number stuff
set relativenumber
set number
set numberwidth=3
highlight LineNr ctermfg=grey

" for all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" don't autocomment next line after setting comment
autocmd FileType * setlocal formatoptions-=cro

" format, color, and distinguish between current and noncurrent window
set laststatus=2
"set statusline=[%n] " buffer number
"set statusline+=\ " seperator
"set statusline+=%<%F\ \ \ " filename
"set statusline+=[%M%R%H%W%Y][%{&ff}]\ \ %=\ %l/%L\ %c\ \ \
"highlight StatusLine ctermbg=black ctermfg=blue
"highlight StatusLineNC ctermbg=black ctermfg=grey

source ~/.vim/bindings.vim
source ~/.vim/airlineconfig.vim
