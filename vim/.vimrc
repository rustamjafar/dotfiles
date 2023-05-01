set shell=/usr/local/bin/bash
set encoding=utf-8

" language specific
set arabicshape
set listchars=space:*,extends:>,precedes:<,tab:\|>,eol:$
"set keymap=russian-jcukenwin
"set keymap=arabic_utf-8

" set mapleader
let mapleader = ","

" syntax highlight
syntax on

" set background dark/light
set background=dark

" make vim to recognize space normally
set backspace=indent,eol,start

" ???????????????
set iminsert=0
set imsearch=0

" changes default dir to currentfile dir
set autochdir

" Show matching brackets
set showmatch

set wrap " Wrap text that goes beyond screen length
set colorcolumn=80 " colors column
set textwidth=80 " line break at 80col
hi ColorColumn ctermbg=darkgrey
hi ExtraWhitespace ctermbg=darkgrey
match ExtraWhitespace /\s\+$/

" disabled autofolding
set nofoldenable

" Hide line numbers
set nonumber

" Stop system vim sounds
set noerrorbells

" no scrollbars
"set guioptions=

" search-centricity
set ttyfast
set nohlsearch " highlight search
set ignorecase " ignorecase
set incsearch " highlight while typing
set scrolloff=5 " 5 lines before/after cursor preserved

" remove search highlight (not needed in Vim9)
"nnoremap <C-L> :nohl<CR><C-L>

" show commands written
"set showcmd

" use systems clipboard
set clipboard=unnamed

" set fo+=
set formatoptions+=t

set softtabstop=4 " amount of whitespaces inserted on each <tab> press
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " converts \t into <tabstop> amount of spaces

" no backup files
set nobackup
set noswapfile
set nowritebackup

" source on save
"autocmd BufWritePost vimrc source %

" turn on the detection of ft, plugins and indents
filetype plugin indent on

" Vim-Plugin
call plug#begin('~/.vim/plugged')

   Plug 'prettier/vim-prettier'
   Plug 'vim-pandoc/vim-pandoc'
   Plug 'vim-pandoc/vim-pandoc-syntax'
   "Plug 'rwxrob/vim-pandoc-syntax-simple'
   Plug 'rrethy/vim-illuminate'  " highlight words under cursor
   Plug 'mattn/emmet-vim' " html&css
   "Plug 'loremipsum' "don't work w/ Vim-Plugin

call plug#end()

" --------------------------------
" Plugin Customization Begins Here
" --------------------------------

" --------------------------------
" vim-surround
" --------------------------------

" https://ascii.cl/  : ascii character codes
" https://github.com/tpope/vim-surround/blob/master/doc/surround.txt

" --------------------------------
" vim-pandoc
" --------------------------------

" enable=1 / disable=0 spelling
let g:pandoc#spell#enabled = 0

" Width of the window's foldcolumn. disable=0. (annoying 1st column)
let g:pandoc#folding#fdc = 0

" turn off conceal of vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0

" --------------------------------
" remapping
" map: normal, visual, select and operator pendingm modes
" map!: insert, command-line
" :help key-notation
" --------------------------------

" inserting one line below/above the current
nmap <S-Return> O<Esc>
nmap <CR> o<Esc>

" rtl / ltr
" map <S-l> :set rl<CR>
" map! <S-l> :set rl<CR>a
" map <S-h> :set norl<CR>
" map! <S-h> :set norl<CR>a

" ----------------------
" statusline setup
" ----------------------

set ruler
set ruf=%30(%=%#Normal#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
