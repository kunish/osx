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

-- custom keybindings
vim.api.nvim_set_keymap("n", "<C-S>", "<cmd>write<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-J>", "<cmd>wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<cmd>wincmd l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-A>", "<C-O>^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-E>", "<C-O>$", { noremap = true, silent = true })
--
