local general = {}

function general.setup()
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
	vim.opt.showmode = false
	vim.opt.signcolumn = "number"
	vim.opt.splitbelow = true
	vim.opt.splitright = true
	vim.opt.swapfile = false
	vim.opt.tabstop = 2
	vim.opt.termguicolors = true
	vim.opt.undofile = true
	vim.opt.updatetime = 250
	vim.opt.wrap = false
	vim.opt.signcolumn = "yes"

	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	-- autocmd
	vim.cmd([[
    augroup general
      autocmd!
      autocmd TermOpen * setlocal nonumber norelativenumber
    augroup end
  ]])
	--

	-- custom keybindings
	local noremap_opts = { noremap = true, silent = true }

	vim.api.nvim_set_keymap("n", "<C-S>", "<cmd>write<CR>", noremap_opts)
	vim.api.nvim_set_keymap("n", "<C-H>", "<cmd>wincmd h<CR>", noremap_opts)
	vim.api.nvim_set_keymap("n", "<C-J>", "<cmd>wincmd j<CR>", noremap_opts)
	vim.api.nvim_set_keymap("n", "<C-K>", "<cmd>wincmd k<CR>", noremap_opts)
	vim.api.nvim_set_keymap("n", "<C-L>", "<cmd>wincmd l<CR>", noremap_opts)
	vim.api.nvim_set_keymap("i", "<C-A>", "<C-O>^", noremap_opts)
	vim.api.nvim_set_keymap("i", "<C-E>", "<C-O>$", noremap_opts)
	--
end

return general
