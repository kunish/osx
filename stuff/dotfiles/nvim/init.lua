local set = vim.opt
local let = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

set.clipboard = 'unnamed'
set.completeopt = 'menuone,noselect'
set.expandtab = true
set.ignorecase = true
set.lazyredraw = true
set.shiftwidth = 2
set.shortmess:append('Ic')
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.undofile = true
set.updatetime = 300
set.wrap = false

let.mapleader = ' '
let.maplocalleader = ' '

-- packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'editorconfig/editorconfig-vim'
  use 'haya14busa/incsearch.vim'
  use 'honza/vim-snippets'
  use 'houtsnip/vim-emacscommandline'
  use 'jiangmiao/auto-pairs'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'morhetz/gruvbox'
  use 'ntpeters/vim-better-whitespace'
  use 'terryma/vim-multiple-cursors'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'vim-scripts/ReplaceWithRegister'
  use 'vim-scripts/undotree.vim'
  use 'airblade/vim-gitgutter'

  use 'wbthomason/packer.nvim'
  use 'folke/which-key.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'phaazon/hop.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'andymass/vim-matchup'
end)

cmd('silent! colorscheme gruvbox')

require'nvim-web-devicons'.setup { default = true }
require'lualine'.setup {}
require'telescope'.setup {}
require'hop'.setup {}
require'which-key'.setup {}

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = { enable = true, },
  indent = { enable = true },
  matchup = { enable = true, },
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
    move = {
      enable = true,
      set_jumps = true,
    }
  },
}

-- lspconfig
local lspconfig = require'lspconfig'
local cmp = require'cmp'
local luasnip = require'luasnip'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>leq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

local servers = {
  'ansiblels',
  'bashls',
  'cssls',
  'diagnosticls',
  'dockerls',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'terraformls',
  'vimls',
  'vuels',
  'yamlls',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'markdown',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  },
  init_options = {
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatFiletypes = {
      css = 'prettier',
      html = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      markdown = 'prettier',
      scss = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      yaml = 'prettier',
    },
    linters = {
      eslint = {
        command = 'eslint',
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json',
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity',
        },
        securities = {
          [1] = 'warning',
          [2] = 'error',
        },
      },
    },
    formatters = {
      prettier = {
        command = 'prettier',
        args = {
          '--stdin-filepath',
          '%filepath',
        },
      },
    },
  },
}
--

-- cmp
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if fn.pumvisible() == 1 then
        fn.feedkeys(api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if fn.pumvisible() == 1 then
        fn.feedkeys(api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        fn.feedkeys(api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
}
--

-- nvimtree
let.nvim_tree_width = 36
let.nvim_tree_auto_close = 1
let.nvim_tree_follow = 1
let.nvim_tree_quit_on_open = 1
let.nvim_tree_highlight_opened_files = 1

api.nvim_set_keymap('n', '<leader>fl', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
--

-- telescope
api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
--

-- hop
api.nvim_set_keymap('n', '<leader><leader>j', ':HopLineStart<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader><leader>w', ':HopWord<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader><leader>s', ':HopChar1<CR>', { noremap = true, silent = true })
--

-- incsearch
let['incsearch#auto_nohlsearch'] = 1

api.nvim_set_keymap('n', 'n', '<Plug>(incsearch-nohl-n)', {})
api.nvim_set_keymap('n', 'N', '<Plug>(incsearch-nohl-N)', {})
api.nvim_set_keymap('n', '*', '<Plug>(incsearch-nohl-*)', {})
api.nvim_set_keymap('n', '#', '<Plug>(incsearch-nohl-#)', {})
api.nvim_set_keymap('n', 'g*', '<Plug>(incsearch-nohl-g*)', {})
api.nvim_set_keymap('n', 'g#', '<Plug>(incsearch-nohl-g#)', {})
--

-- custom keybindings
api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-s>', ':write<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-h>', '<cmd>wincmd h<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-j>', '<cmd>wincmd j<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-k>', '<cmd>wincmd k<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-l>', '<cmd>wincmd l<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Tab>', '<cmd>bnext<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-tab>', '<cmd>bprev<CR>', { noremap = true, silent = true })
--
