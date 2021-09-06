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
set nowrap
set nowritebackup
set shiftwidth=2
set shortmess+=Ic
set signcolumn=number
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=500
set updatetime=300
set visualbell

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" vimplug start
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'andrewradev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'folke/which-key.nvim'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'hoob3rt/lualine.nvim'
Plug 'houtsnip/vim-emacscommandline'
Plug 'ianva/vim-youdao-translater'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kaicataldo/material.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'osyo-manga/vim-over'
Plug 'phaazon/hop.nvim'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/unite.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/matchit.zip'
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

" devicons start
lua << EOF
require'nvim-web-devicons'.setup {
  default = true
}
EOF
" devicons end

" lualine start
lua << EOF
require('lualine').setup {}
EOF
" lualine end

" nvimtree start
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_highlight_opened_files = 1

nnoremap <silent> <leader>fl <cmd>NvimTreeToggle<CR>
" nvimtree end

" whichkey start
lua << EOF
require("which-key").setup {}
EOF
" whichkey end

" hop start
lua << EOF
require'hop'.setup {}
EOF

nnoremap <silent> <leader><leader>j <cmd>HopLineStartAC<CR>
nnoremap <silent> <leader><leader>k <cmd>HopLineStartBC<CR>
nnoremap <silent> <leader><leader>w <cmd>HopWordAC<CR>
nnoremap <silent> <leader><leader>s <cmd>HopChar1AC<CR>
nnoremap <silent> <leader><leader>S <cmd>HopChar1BC<CR>
" hop end

" treesitter start
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  textobjects = {
    lsp_interop = { enable = true },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ab"] = "@block.outer",
        ["ac"] = "@class.outer",
        ["af"] = "@function.outer",
        ["ak"] = "@comment.outer",
        ["al"] = "@loop.outer",
        ["ap"] = "@parameter.outer",
        ["ib"] = "@block.inner",
        ["ic"] = "@class.inner",
        ["if"] = "@function.inner",
        ["il"] = "@loop.inner",
        ["ip"] = "@parameter.inner",
      },
    },
  },
}
EOF
" treesitter end

" coc start
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

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

nmap <silent> <leader>cgi <Plug>(coc-implementation)
nmap <silent> <leader>cgr <Plug>(coc-references)
nmap <silent> <leader>cgy <Plug>(coc-type-definition)
nmap <silent> <leader>crn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)

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
let g:incsearch#auto_nohlsearch = 1

map <silent> n <Plug>(incsearch-nohl-n)
map <silent> N <Plug>(incsearch-nohl-N)
map <silent> * <Plug>(incsearch-nohl-*)
map <silent> # <Plug>(incsearch-nohl-#)
map <silent> g* <Plug>(incsearch-nohl-g*)
map <silent> g# <Plug>(incsearch-nohl-g#)
" incsearch end

" telescope start
lua << EOF
require('telescope').setup {}
EOF

nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
" telescope end

" custom keybinding start
inoremap <silent> jk <Esc>
nnoremap <silent> <C-h> <cmd>wincmd h<CR>
nnoremap <silent> <C-j> <cmd>wincmd j<CR>
nnoremap <silent> <C-k> <cmd>wincmd k<CR>
nnoremap <silent> <C-l> <cmd>wincmd l<CR>
nnoremap <silent> <Tab> <cmd>bnext<CR>
nnoremap <silent> <S-Tab> <cmd>bprev<CR>
" custom keybinding end
