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
set lazyredraw
set nobackup
set noswapfile
set notimeout
set nowrap
set nowritebackup
set shiftwidth=2
set shortmess+=c
set shortmess=I
set signcolumn=number
set splitbelow
set splitright
set tabstop=2
set termguicolors
set updatetime=300
set visualbell

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let mapleader="\<Space>"
let maplocalleader="\<Space>"

let g:airline_theme='dark'
let g:incsearch#auto_nohlsearch = 1
let g:sneak#label=1
let g:vimfiler_as_default_explorer=1
let g:coc_config_home = '~/.vim'
let g:coc_global_extensions=[
      \'coc-angular',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-deno',
      \'coc-docker',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-flutter',
      \'coc-git',
      \'coc-go',
      \'coc-highlight',
      \'coc-html',
      \'coc-html-css-support',
      \'coc-json',
      \'coc-prettier',
      \'coc-pyright',
      \'coc-rls',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sql',
      \'coc-toml',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \'coc-yaml',
      \]

" vimplug start
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'andrewradev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'glts/vim-textobj-comment'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'houtsnip/vim-emacscommandline'
Plug 'ianva/vim-youdao-translater'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kaicataldo/material.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'osyo-manga/vim-over'
Plug 'phaazon/hop.nvim'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/matchit.zip'
Plug 'wellle/targets.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

command! PU PlugUpdate | PlugUpgrade
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" vimplug end

" style start
silent! colorscheme gruvbox
" style end

" vimfiler start
call vimfiler#custom#profile('default', 'context', {
      \ 'auto_expand': 1,
      \ 'explorer': 1,
      \ 'explorer_columns': 'type:size',
      \ 'find': 1,
      \ 'no_quit' : 1,
      \ 'parent': 0,
      \ 'split' : 1,
      \ 'status' : 0,
      \ 'winwidth' : 40,
      \ }
      \ )
autocmd VimEnter * if !argc() | VimFiler | endif
autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1
      \ && &filetype ==# 'vimfiler') | quit | endif
nmap <silent> <leader>fl :VimFiler<CR>
" vimfiler end

" hop start
lua << EOF
require'hop'.setup()
EOF

nnoremap <silent> <leader><leader>j :HopLineStartAC<CR>
nnoremap <silent> <leader><leader>k :HopLineStartBC<CR>
nnoremap <silent> <leader><leader>w :HopWordAC<CR>
nnoremap <silent> <leader><leader>s :HopChar1AC<CR>
nnoremap <silent> <leader><leader>S :HopChar1BC<CR>
" hop end

" treesitter start
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}
EOF
" treesitter end

" coc start
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

inoremap <silent><expr> <c-j> coc#refresh()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'help' . ' ' . expand('<cword>')
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
inoremap <silent> <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')
" coc end

" incsearch start
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" incsearch end

" fzf start
nmap <silent> <leader>fa :Ag<CR>
nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fr :Rg<CR>
" fzf end

" custom keybinding start
inoremap <silent> jk <Esc>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader>R :source $MYVIMRC<CR>
" custom keybinding end
