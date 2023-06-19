set shell=/usr/bin/bash
set encoding=utf-8      " The encoding displayed on screen
set fileencoding=utf-8  " The encoding written to file.

" languages
"set arabicshape
"set keymap=russian-jcukenwin
"set keymap=arabic_utf-8

" keyboard
set listchars=space:*,extends:>,precedes:<,tab:\|>,eol:$
set backspace=indent,eol,start

" ???????????????
set iminsert=0
set imsearch=0

augroup vimrc_autocmd
    au!
    " bg dark
augroup END

" set mapleader
let mapleader = ","

" syntax highlight
" colorscheme is from fogbell
"runtime colors/
colorscheme fogbell

" set highlighting groups
hi clear Conceal
hi Normal ctermfg=white ctermbg=black
hi Statement ctermfg=white
hi Todo ctermfg=none
hi Comment ctermfg=249
hi PreProc ctermfg=white
hi Identifier ctermfg=white
hi String ctermfg=white
hi Operator ctermfg=white
hi Number ctermfg=white
hi Special ctermfg=white
hi Ignore ctermfg=white
hi Function ctermfg=white
hi Boolean ctermfg=white
hi Conditional ctermfg=white

" set colors on vim start
au VimEnter * hi clear Conceal
au VimEnter * hi Normal ctermfg=white ctermbg=black
au VimEnter * hi Statement ctermfg=white
au VimEnter * hi Todo ctermfg=none
au VimEnter * hi Comment ctermfg=249
au VimEnter * hi PreProc ctermfg=white
au VimEnter * hi Identifier ctermfg=white
au VimEnter * hi String ctermfg=white
au VimEnter * hi Operator ctermfg=white
au VimEnter * hi Number ctermfg=white
au VimEnter * hi Special ctermfg=white
au VimEnter * hi Ignore ctermfg=white
au VimEnter * hi Function ctermfg=white


" execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")

" concealing
set conceallevel=2

" changes default dir to currentfile dir
set autochdir

" show matching brackets
set noshowmatch                         " disables short snapback
let g:loaded_matchparen = 0             " disables highlighting itself

set wrap                                " wrap text that goes beyond screen
set colorcolumn=80                      " colors column
hi ColorColumn ctermbg=darkgrey
set textwidth=80                        " line break at 80col
hi ExtraWhitespace ctermbg=darkgrey
match ExtraWhitespace /\s\+$/

" disabled autofolding
set nofoldenable

" hide line numbers
set nonumber

" stop system vim sounds
set noerrorbells

" no scrollbars in macvim
"set guioptions=

" search-centricity
set ttyfast
set nohlsearch    " highlight search
set ignorecase    " ignorecase
set incsearch     " highlight while typing
set scrolloff=5   " 5 lines before/after cursor preserved

" remove search highlight (not needed in Vim9)
"nnoremap <C-L> :nohl<CR><C-L>

" show commands written
"set showcmd

" use systems clipboard (macvim)
"set clipboard=unnamed

" ?????????????? set fo+=
set formatoptions+=t

" working w/ tab
set softtabstop=4 " amount of whitespaces inserted on each <tab> press
set tabstop=4     " show existing tab with 4 spaces width
set shiftwidth=4  " when indenting with '>', use 4 spaces width
set expandtab     " converts \t into <tabstop> amount of spaces

" no backup files
set nobackup
set noswapfile
set nowritebackup

" turn on the detection of ft, plugins and indents
filetype on             " enable filetype detection
filetype plugin on      " load file-specific plugins
filetype indent on      " load file-specific indentation

" Vim-Plugin
" autoload vim-plugin if not found
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')

   Plug 'vim-pandoc/vim-pandoc'
   Plug 'lervag/vimtex'

call plug#end()

" --------------------------------
" Plugin Customization Begins Here
" --------------------------------

" --------------------------------
" vim-pandoc
" --------------------------------

" enable=1 / disable=0 spelling
let g:pandoc#spell#enabled = 0

" annoying 1st f oldcolumn width. disable=0.
let g:pandoc#folding#fdc = 0

" turn off conceal of vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0

" --------------------------------
" vimtex
" --------------------------------

" disable matching parenth (def 1)
let g:vimtex_matchparen_enabled = 0

let g:vimtex_compiler_latexmk = {
        \ 'aux_dir' : '',
        \ 'out_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

let g:vimtex_quickfix_open_on_warning = 1

" --------------------------------
" remapping
" map: normal, visual, select and operator pendingm modes
" map!: insert, command-line
" :help key-notation
" --------------------------------

" texsnip
noremap <leader>tex :.!texsnip<CR>

" 'Y' as 'D'
map <S-Y> y$

" reload vimrc
nnoremap <C-W>r :so $MYVIMRC<CR>

" inserting one line below/above the current
"nnoremap <S-k> O<Esc>
nnoremap <CR> o<Esc>

" rtl / ltr
"nnoremap <leader>h :set norl<CR>
"inoremap <leader>h :set norl<CR>a
"nnoremap <leader>l :set rl<CR>
"inoremap <leader>l :set rl<CR>a

" pathname completion
inoremap <leader><C-I> <C-X><C-F>

" ----------------------
" statusline setup
" ----------------------

set ruler
set ruf=%30(%=%#Normal#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
