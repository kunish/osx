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
set shiftwidth=2
set shortmess=I
set splitbelow
set splitright
set tabstop=2
set visualbell
if (has('nvim'))
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let mapleader="\<Space>"
let maplocalleader="\<Space>"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let g:EasyMotion_smartcase = 1
let g:airline_theme='dark'
let g:go_doc_popup_window=1
let g:go_echo_command_info=0
let g:incsearch#auto_nohlsearch = 1
let g:sneak#label=1
let g:vimfiler_as_default_explorer=1
let g:coc_global_extensions=[
      \'coc-angular',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-deno',
      \'coc-docker',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-flutter',
      \'coc-fzf-preview',
      \'coc-git',
      \'coc-highlight',
      \'coc-html',
      \'coc-html-css-support',
      \'coc-jedi',
      \'coc-json',
      \'coc-prettier',
      \'coc-rls',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sql',
      \'coc-toml',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \]

" vimplug start
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" essential
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
" language
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'mattn/emmet-vim'
Plug 'neoclide/jsonc.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
" interface
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-over'
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
" tools
Plug 'ianva/vim-youdao-translater'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'justinmk/vim-sneak'
" completion
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-commentary'
" always last
Plug 'ryanoasis/vim-devicons'
call plug#end()

command! PU PlugUpdate | PlugUpgrade
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" vimplug end

" style start
colorscheme gruvbox
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
" vimfiler end

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'help' . ' ' . expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . '' . expand('<cword>')
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
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" incsearch end
"
" fzf start
nmap <silent> <leader>fa :Ag<CR>
nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>fr :Rg<CR>
" fzf end

nmap <silent> <leader>fl :VimFiler<CR>

" custom keybinding start
inoremap <silent> jk <Esc>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <leader>R :source $MYVIMRC<CR>
" custom keybinding end
