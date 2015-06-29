" Enable central plugin repository
source /opt/lisa/os/vim/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('/opt/lisa/os/vim/bundle')

" Default indentation and tab settings
set autoindent " New line inherits indentation from the previous line
set nosmartindent " Avoid losing indentation when inserting '#'
set cindent " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4
set shiftwidth=4
set expandtab
set ruler

" Syntax highlight
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights
set hlsearch " Highlight results of search

" Strip trailing whitespace off all lines every time you save a .py or .pyx file
" so you don't have to worry about removing it manually before you commit.
autocmd BufWritePre *.py,*.pyx :%s/\s\+$//e

" Vim scrolling (!!!) - NOTE: to select text with mouse keep shift pressed
"set mouse=a
"set ttymouse=xterm

" Draw a yellow column after 80 lines
"set colorcolumn=80
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=darkyellow
    "aGrey
    call matchadd('ColorColumn', '\%81v', 100)
    "call matchadd('ColorColumn', '\%76v', 100)
    "let &colorcolumn=join(range(81,999),",")
    "let &colorcolumn="80,".join(range(120,999),",")
endif

" set statusline+=%F
set laststatus=2
set omnifunc=syntaxcomplete#Complete  " Enable omnicompletion for programming syntax (Ctrl+X-Ctrl+O brings menu up)
set number
set statusline=[%n]\ %<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
"set statusline=
"set statusline=[%n]\ %F
"set statusline +=[%n]\ %<%F%h%m
"set statusline +=%1*%=%5l           "current line
"set statusline +=%2*/%L%*           "total lines
"set statusline +=%1*%4v\            "virtual column number
