set number
set cursorline 
set encoding=utf8 
set nocompatible
:language C 
:syntax on
:colorscheme papercolors 


source $HOME/.local/share/nvim/site/autoload/plug.vim
call plug#begin('$HOME/.local/share/nvim/site/autoload/plugins')
 Plug 'ycm-core/YouCompleteMe'
 Plug 'dense-analysis/ale'
 Plug 'sheerun/vim-polyglot'
 Plug 'frazrepo/vim-rainbow'
 Plug 'tpope/vim-fugitive'
 Plug 'Lokaltog/vim-powerline'
 Plug 'neovim/nvim-lspconfig'
 Plug 'mileszs/ack.vim'

call plug#end()

let g:ycm_clangd_binary_path="/usr/bin/clangd"

let g:rainbow_active = 1
