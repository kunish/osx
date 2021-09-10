require("which-key").setup()
require("lualine").setup()
require("gitsigns").setup()
require("nvim-web-devicons").setup({ default = true })

-- nvimtree
vim.g.nvim_tree_width = 36
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_highlight_opened_files = 1

vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
--

-- barbar
vim.g.bufferline = {
	animation = false,
	auto_hide = true,
}

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bo", "<cmd>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bh", "<cmd>BufferCloseBuffersLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bl", "<cmd>BufferCloseBuffersRight<CR>", { noremap = true, silent = true })
--
