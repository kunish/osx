require("which-key").setup()
require("lualine").setup()
require("gitsigns").setup()
require("nvim-web-devicons").setup({ default = true })

-- gruvbox
vim.g.gruvbox_contrast_dark = "hard"
vim.cmd("silent! colorscheme gruvbox")
--

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

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
--

-- barbar
vim.g.bufferline = { animation = false, auto_hide = true }

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bC", "<cmd>BufferClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bO", "<cmd>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bH", "<cmd>BufferCloseBuffersLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bL", "<cmd>BufferCloseBuffersRight<CR>", { noremap = true, silent = true })
--

vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
