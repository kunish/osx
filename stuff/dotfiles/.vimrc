let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

set background=dark
set backspace=2
set clipboard=unnamed
set expandtab
set go=
set guicursor+=a:blinkon0
set hidden
set ignorecase
set nobackup
set noswapfile
set notimeout
set nowrap
set nowritebackup
set number
set shiftwidth=2
set tabstop=2

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme onedark

let g:airline_theme = 'onedark'
let g:NERDTreeShowHidden = 1
let g:ctrlp_show_hidden = 1

let g:coc_global_extensions = [
      \'coc-css',
      \'coc-cssmodules',
      \'coc-deno',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-fzf-preview',
      \'coc-git',
      \'coc-go',
      \'coc-html',
      \'coc-html-css-support',
      \'coc-json',
      \'coc-prettier',
      \'coc-python',
      \'coc-rls',
      \'coc-sh',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :NERDTreeToggle<CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

command! -nargs=0 Format :call CocAction('format')
