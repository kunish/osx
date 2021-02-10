set nowrap
set hidden
set notimeout
set number
set expandtab
set shiftwidth=2
set tabstop=2
set background=dark
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set go=
set guicursor+=a:blinkon0
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'rust-lang/rust.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'shougo/deoplete.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme gruvbox
let g:ctrlp_show_hidden = 1
let g:NERDTreeShowHidden = 1

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :NERDTreeToggle<CR>

nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>ws :sp<CR>
nnoremap <silent> <leader>wv :vs<CR>
nnoremap <silent> <leader>wq :wincmd q<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>

nnoremap <silent> <leader>ss :source %<CR>
nnoremap <silent> <C-z> :x<CR>
nnoremap <silent> <leader>fs :w<CR>
