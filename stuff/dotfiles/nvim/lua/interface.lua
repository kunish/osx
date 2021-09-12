local noremap_opts = { noremap = true, silent = true }

require("which-key").setup()
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

vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", noremap_opts)
--

-- barbar
vim.g.bufferline = { animation = false, auto_hide = true }

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferNext<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>BufferPrevious<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>bC", "<cmd>BufferClose<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>bO", "<cmd>BufferCloseAllButCurrent<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>bH", "<cmd>BufferCloseBuffersLeft<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>bL", "<cmd>BufferCloseBuffersRight<CR>", noremap_opts)
--

vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 500, on_visual = true })
  augroup end
]])
