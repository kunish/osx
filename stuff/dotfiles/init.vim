set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

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
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :NERDTreeToggle<CR>
let g:ctrlp_show_hidden = 1
let g:NERDTreeShowHidden = 1
