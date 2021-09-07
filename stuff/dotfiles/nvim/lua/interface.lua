local api = vim.api
local let = vim.g

require'which-key'.setup {}
require'lualine'.setup {}
require'nvim-web-devicons'.setup { default = true }

-- nvimtree
let.nvim_tree_width = 36
let.nvim_tree_auto_close = 1
let.nvim_tree_follow = 1
let.nvim_tree_quit_on_open = 1
let.nvim_tree_highlight_opened_files = 1

api.nvim_set_keymap('n', '<leader>fl', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
--

