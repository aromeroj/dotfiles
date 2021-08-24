syntax enable

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set incsearch
set cursorline
set showmatch
set incsearch

set colorcolumn=80
set background=dark

if has("gui_macvim")
    set transparency=5
endif

let python_highlight_all = 1

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

call plug#end()

let mapleader = " "
colorscheme gruvbox
let g:airline_theme='gruvbox'

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
