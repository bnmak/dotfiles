" This must be first, because it changes other options as a side effect.
  set nocompatible

" color stuff
set t_Co=256
syntax on
set background=dark
colorscheme solarized

" pathogen stuff
call pathogen#helptags()
call pathogen#infect()

" tab is four spaces
set tabstop=4

" " allow backspacing over everything in insert mode
set backspace=indent,eol,start

set encoding=utf8	" explains itself

set backup		" keep a backup file

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nohlsearch " do not highlight search terms

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

set showmatch " show matching parens

set smartcase " ignore case when searching if pattern is all lowercase, otherwise case-sensitive

set visualbell " don't beep

" status line stuff
set laststatus=2
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ %l/%L\ %c\ \ \ 

set runtimepath^=~/.vim/bundle/ctrlp.vim " nice completions

set backupdir=~/.vimbackup  " change backup and swap
set directory=~/.vimswap    " storage locations

set number " always display line numbers
highlight LineNr ctermfg=darkgrey " color the line number
