set background=dark
set backspace=2
set clipboard=unnamed
set encoding=UTF-8
set expandtab
set guicursor=a:blinkon0
set guifont=RobotoMono\ Nerd\ Font\:h12
set guioptions=
set hidden
set hlsearch
set ignorecase
set nobackup
set noswapfile
set notimeout
set nowrap
set nowritebackup
set number
set relativenumber
set shiftwidth=2
set shortmess=I
set tabstop=2

let mapleader="\<Space>"
let maplocalleader="\<Space>"

let g:coc_global_extensions=[
      \'coc-css',
      \'coc-cssmodules',
      \'coc-deno',
      \'coc-docker',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-fzf-preview',
      \'coc-git',
      \'coc-go',
      \'coc-html',
      \'coc-html-css-support',
      \'coc-jedi',
      \'coc-json',
      \'coc-prettier',
      \'coc-rls',
      \'coc-sh',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \]

call plug#begin()
" essential
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
" language
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/dockerfile.vim'
" interface
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'joshdick/onedark.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'osyo-manga/vim-over'
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
" tools
Plug 'andrewradev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'glts/vim-textobj-comment'
Plug 'houtsnip/vim-emacscommandline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'octref/rootignore'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'justinmk/vim-sneak'
" completion
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'shougo/deoplete.nvim'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
" always last
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme onedark

let g:airline_theme='onedark'
let g:sneak#label=1
let g:vimfiler_as_default_explorer=1
let g:yankring_history_dir = '$VIM'

" coc start
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd CursorHold * silent call CocActionAsync('highlight')
" coc end

" incsearch start
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" incsearch end

nnoremap <silent> <leader>R :source ~/.vimrc<CR>
nmap <silent> <leader>gf :Format<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fa :Ag<CR>
nmap <silent> <leader>fr :Rg<CR>
nmap <silent> <leader>fl :VimFiler<CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

inoremap <silent> jk <Esc>

autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
