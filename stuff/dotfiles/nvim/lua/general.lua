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
	vim.opt.fillchars = "eob: "

	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
end

return general
