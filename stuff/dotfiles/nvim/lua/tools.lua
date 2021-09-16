local tools = {}

function tools.setup()
	require("hop").setup()
	require("nvim_comment").setup()
	require("nvim-ts-autotag").setup()
	require("nvim-autopairs").setup({
		check_ts = true,
		disable_filetype = { "TelescopePrompt" },
	})
	require("nvim-autopairs.completion.cmp").setup({
		map_cr = true,
		map_complete = true,
		auto_select = true,
	})

	require("telescope").setup({
		defaults = {
			layout_strategy = "vertical",
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			file_browser = {
				hidden = true,
			},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("dap")
	require("telescope").load_extension("emoji")

	-- neoformat
	vim.g["neoformat_basic_format_align"] = 1
	vim.g["neoformat_basic_format_retab"] = 1
	vim.g["neoformat_basic_format_trim"] = 1
	vim.g["neoformat_try_node_exe"] = 1

	-- emmet
	vim.g.user_emmet_leader_key = "<C-Z>"

	-- incsearch
	vim.g["incsearch#auto_nohlsearch"] = 1
end

return tools
