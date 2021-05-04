let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

set background=dark
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
Plug 'w0rp/ale'
call plug#end()

colorscheme onedark
let g:NERDTreeShowHidden = 1
let g:airline_theme='onedark'
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
      \]

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fl :NERDTreeToggle<CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>wq :wincmd q<CR>
nnoremap <silent> <leader>ws :sp<CR>
nnoremap <silent> <leader>wv :vs<CR>

nnoremap <silent> <C-z> :x<CR>
nnoremap <silent> <leader>fs :w<CR>
nnoremap <silent> <leader>ss :source %<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
