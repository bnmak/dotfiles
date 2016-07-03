set nocompatible
set hidden

" color
syntax on
set background=dark
set term=screen-256color
set t_Co=256
let g:solarlized_termcolors=256
colorscheme jellybeans

" pathogen
call pathogen#helptags()
call pathogen#infect()
execute pathogen#infect('bundle.remote/{}')

" general configuration
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
set nostartofline 	  " maintain horizontal position
set mps+=<:>          " also match these when using % to jump between
set ttimeoutlen=50

" line number
set relativenumber
set number
set numberwidth=3

" filetypes
augroup FileTypeStuff
	" for all text files set 'textwidth' to 78 characters.
	autocmd FileType text set textwidth=78

	" auto-wrap text
	autocmd FileType * set formatoptions+=t

	" auto-wrap comments and insert leader automatically
	autocmd FileType * set formatoptions+=c

	" do not insert comment leader after o/O
	autocmd FileType * set formatoptions-=o
	"
	" do not insert comment leader after enter in insert mode
	autocmd FileType * set formatoptions-=r
augroup END
filetype plugin on
filetype indent on

" status line stuff
set laststatus=2
set statusline=[%n] " buffer number
set statusline+=\ " seperator
set statusline+=%<%F\ \ \ " filename
set statusline+=[%M%R%H%W%Y][%{&ff}]\ \ %=\ %l/%L\ %c\ \ \

" make netrw be correct
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
