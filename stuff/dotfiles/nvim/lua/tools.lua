local noremap_opts = { noremap = true, silent = true }

require("hop").setup()
require("nvim_comment").setup()
require("nvim-autopairs").setup({ check_ts = true })
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true,
	map_complete = true,
	auto_select = true,
})
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-U>"] = false,
				["<C-D>"] = false,
			},
		},
	},
})

-- emmet
vim.g.user_emmet_leader_key = "<C-Z>"
--

-- telescope
vim.api.nvim_set_keymap("n", "<Leader>bs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fa", "<cmd>Telescope builtin<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fg", "<cmd>Telescope git_status<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fl", "<cmd>Telescope file_browser<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fm", "<cmd>Telescope man_pages<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>fs", "<cmd>Telescope live_grep<CR>", noremap_opts)
--

-- hop
vim.api.nvim_set_keymap("n", "<Leader><Leader><Leader>", "<cmd>HopLineStart<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWord<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader><Leader>s", "<cmd>HopChar1<CR>", noremap_opts)
--

-- incsearch
vim.g["incsearch#auto_nohlsearch"] = 1

vim.api.nvim_set_keymap("n", "n", "<Plug>(incsearch-nohl-n)", {})
vim.api.nvim_set_keymap("n", "N", "<Plug>(incsearch-nohl-N)", {})
vim.api.nvim_set_keymap("n", "*", "<Plug>(incsearch-nohl-*)", {})
vim.api.nvim_set_keymap("n", "#", "<Plug>(incsearch-nohl-#)", {})
vim.api.nvim_set_keymap("n", "g*", "<Plug>(incsearch-nohl-g*)", {})
vim.api.nvim_set_keymap("n", "g#", "<Plug>(incsearch-nohl-g#)", {})
--
