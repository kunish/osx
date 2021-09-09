require("which-key").setup({})
require("lualine").setup({})
require("nvim-web-devicons").setup({ default = true })
require("gitsigns").setup()

-- nvimtree
vim.g.nvim_tree_width = 36
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_highlight_opened_files = 1

vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
--
