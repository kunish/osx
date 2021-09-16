local tools = {}

function tools.setup()
	require("hop").setup()
	require("nvim_comment").setup()
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
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("dap")
	require("telescope").load_extension("emoji")

	-- emmet
	vim.g.user_emmet_leader_key = "<C-Z>"
	--

	-- incsearch
	vim.g["incsearch#auto_nohlsearch"] = 1
	--
end

return tools
