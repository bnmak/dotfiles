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
set number            " always display line numbers
set numberwidth=3
highlight LineNr ctermfg=grey
set modelines=0       " security hole!
set wildmenu          " nice completion                  
set showmatch         " show matching parens
set smartcase         " ignore case when searching if pattern is all lowercase, otherwise case-sensitive
set visualbell        " don't beep
set autoread          " reload file when changed outside of vim
set mps+=<:>          " also match these when using % to jump between

filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
augroup END

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " don't autocomment next line after setting comment

" status line stuff
set laststatus=2
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ %l/%L\ %c\ \ \ 
highlight StatusLine ctermbg=white ctermfg=black " nicer looking status line

" remap leader

let mapleader=","

" easymotion stuff
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1
