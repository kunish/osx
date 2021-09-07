local api = vim.api
local cmd = vim.cmd
local let = vim.g
local set = vim.opt

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

cmd('silent! colorscheme gruvbox')

-- custom keybindings
local noremap_opts = { noremap = true, silent = true }
api.nvim_set_keymap('i', 'jk', '<Esc>', noremap_opts)
api.nvim_set_keymap('n', '<C-s>', ':write<CR>', noremap_opts)
api.nvim_set_keymap('n', '<C-h>', '<cmd>wincmd h<CR>', noremap_opts)
api.nvim_set_keymap('n', '<C-j>', '<cmd>wincmd j<CR>', noremap_opts)
api.nvim_set_keymap('n', '<C-k>', '<cmd>wincmd k<CR>', noremap_opts)
api.nvim_set_keymap('n', '<C-l>', '<cmd>wincmd l<CR>', noremap_opts)
api.nvim_set_keymap('n', '<Tab>', '<cmd>bnext<CR>', noremap_opts)
api.nvim_set_keymap('n', '<S-tab>', '<cmd>bprev<CR>', noremap_opts)
--

