local set = vim.opt
local let = vim.g
local fn = vim.fn
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

set.background = 'dark'
set.backspace = 'indent,eol,start'
set.backup = false
set.clipboard = 'unnamed'
set.encoding = 'UTF-8'
set.expandtab = true
set.hidden = true
set.hlsearch = true
set.ignorecase = true
set.lazyredraw = true
set.shiftwidth = 2
set.shortmess:append('Ic')
set.signcolumn = 'number'
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.timeoutlen = 500
set.updatetime = 300
set.wrap = false
set.writebackup = false
set.completeopt = 'menuone,noselect'

let.mapleader = ' '
let.maplocalleader = ' '

-- packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'folke/which-key.nvim',
    config = function()
      require'which-key'.setup {}
    end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup { default = true }
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'lualine'.setup {}
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup {}
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    as = 'telescope',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require'telescope'.setup {}
    end
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires ={
      'nvim-treesitter/nvim-treesitter-textobjects',
      'andymass/vim-matchup',
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained',
        highlight = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        textobjects = {
          lsp_interop = { enable = true },
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['ab'] = '@block.outer',
              ['ac'] = '@class.outer',
              ['af'] = '@function.outer',
              ['ak'] = '@comment.outer',
              ['al'] = '@loop.outer',
              ['ap'] = '@parameter.outer',
              ['ib'] = '@block.inner',
              ['ic'] = '@class.inner',
              ['if'] = '@function.inner',
              ['il'] = '@loop.inner',
              ['ip'] = '@parameter.inner',
            },
          },
        },
      }
    end
  }

  use 'editorconfig/editorconfig-vim'
  use 'honza/vim-snippets'
  use 'haya14busa/incsearch.vim'
  use 'houtsnip/vim-emacscommandline'
  use 'jiangmiao/auto-pairs'
  use 'joshdick/onedark.vim'
  use 'kaicataldo/material.vim'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'morhetz/gruvbox'
  use 'ntpeters/vim-better-whitespace'
  use 'osyo-manga/vim-over'
  use 'terryma/vim-multiple-cursors'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'vim-scripts/ReplaceWithRegister'
end)

cmd('colorscheme gruvbox')

-- nvimtree
let.nvim_tree_auto_close = 1
let.nvim_tree_follow = 1
let.nvim_tree_quit_on_open = 1
let.nvim_tree_highlight_opened_files = 1

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
map('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true })

-- hop
map('n', '<leader><leader>j', ':HopLineStartAC<CR>', { noremap = true })
map('n', '<leader><leader>k', ':HopLineStartBC<CR>', { noremap = true })
map('n', '<leader><leader>w', ':HopWordAC<CR>', { noremap = true })
map('n', '<leader><leader>W', ':HopWordBC<CR>', { noremap = true })
map('n', '<leader><leader>s', ':HopChar1AC<CR>', { noremap = true })
map('n', '<leader><leader>S', ':HopChar1BC<CR>', { noremap = true })

-- incsearch
let['incsearch#auto_nohlsearch'] = 1

map('n', 'n', '<Plug>(incsearch-nohl-n)', {})
map('n', 'N', '<Plug>(incsearch-nohl-N)', {})
map('n', '*', '<Plug>(incsearch-nohl-*)', {})
map('n', '#', '<Plug>(incsearch-nohl-#)', {})
map('n', 'g*', '<Plug>(incsearch-nohl-g*)', {})
map('n', 'g#', '<Plug>(incsearch-nohl-g#)', {})

-- custom keybindings
map('i', 'jk', '<esc>', { noremap = true })
map('n', '<c-h>', '<cmd>wincmd h<CR>', { noremap = true })
map('n', '<c-j>', '<cmd>wincmd j<CR>', { noremap = true })
map('n', '<c-k>', '<cmd>wincmd k<CR>', { noremap = true })
map('n', '<c-l>', '<cmd>wincmd l<CR>', { noremap = true })
map('n', '<tab>', '<cmd>bnext<CR>', { noremap = true })
map('n', '<s-tab>', '<cmd>bprev<CR>', { noremap = true })
