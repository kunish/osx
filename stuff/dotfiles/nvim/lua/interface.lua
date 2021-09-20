local interface = {}

function interface.setup()
	require("colorizer").setup(nil, {
		RRGGBBAA = true,
		css = true,
		css_fn = true,
		rgb_fn = true,
		hsl_fn = true,
	})
	require("lualine").setup({
		options = { disabled_filetypes = { "NvimTree" } },
	})
	require("gitsigns").setup()
	require("nvim-web-devicons").setup({ default = true })

	-- nvimtree
	vim.g.nvim_tree_auto_close = 1
	vim.g.nvim_tree_follow = 1
	vim.g.nvim_tree_quit_on_open = 1
	vim.g.nvim_tree_highlight_opened_files = 1
	vim.g.nvim_tree_group_empty = 1
	vim.g.nvim_tree_show_icons = {
		folder_arrows = 0,
		files = 1,
		folders = 1,
		git = 1,
	}

	-- barbar
	vim.g.bufferline = { animation = false, auto_hide = true }

	vim.cmd("silent! colorscheme gruvbox")
end

return interface
