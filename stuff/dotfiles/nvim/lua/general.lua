vim.opt.clipboard = "unnamed"
vim.opt.completeopt = "menuone,noselect"
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("Ic")
vim.opt.signcolumn = "number"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("silent! colorscheme gruvbox")

-- custom keybindings
local noremap_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "jk", "<Esc>", noremap_opts)
vim.api.nvim_set_keymap("n", "<C-s>", ":write<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>wincmd h<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>wincmd j<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>wincmd k<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>wincmd l<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bnext<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>bprev<CR>", noremap_opts)
--
