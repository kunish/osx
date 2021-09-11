require("telescope").setup({})
require("hop").setup({})
require("nvim_comment").setup()
require("nvim-autopairs").setup({
	check_ts = true,
})

-- emmet
vim.g.user_emmet_leader_key = "<C-Z>"
--

local noremap_opts = { noremap = true, silent = true }
-- telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", noremap_opts)
--

-- hop
vim.api.nvim_set_keymap("n", "<leader><leader>j", "<cmd>HopLineStart<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<leader><leader>w", "<cmd>HopWord<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<leader><leader>s", "<cmd>HopChar1<CR>", noremap_opts)
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
