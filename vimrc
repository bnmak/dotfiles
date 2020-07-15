set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'shougo/deoplete.nvim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-commentary'
Plugin 'andymass/vim-matchup'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'tpope/vim-flagship'
" Plugin 'edkolev/tmuxline.vim'
call vundle#end()

filetype plugin indent on
autocmd FileType xdefaults set commentstring=!\ %s
syntax on
syntax sync fromstart

set background=dark
" set t_Co=256
" set t_ut=
" let g:solarlized_termcolors=256
colorscheme cobalt

set encoding=utf8
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set backup
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set history=50
set ruler
set showcmd
set incsearch
set backupdir=~/.vim/.backup
set directory=/tmp
set wildmenu
set wildmode=longest,list,full
set showmatch
set matchpairs+=<:>
set smartcase
set visualbell
set nostartofline
set ttimeoutlen=50
set number
set relativenumber
set numberwidth=3
set hidden
runtime! ftplugin/man.vim

set showtabline=2
set laststatus=2
set guioptions-=e
set statusline=[%n]
set statusline+=\ "
set statusline+=%<%F\ \ \
set statusline+=[%M%R%H%W%Y][%{&ff}]\ \ %=\ %l/%L\ %c\ \ \
