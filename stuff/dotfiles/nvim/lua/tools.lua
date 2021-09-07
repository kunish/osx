local api = vim.api
local let = vim.g

require("telescope").setup({})
require("hop").setup({})

local noremap_opts = { noremap = true, silent = true }
-- telescope
api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", noremap_opts)
api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", noremap_opts)
api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", noremap_opts)
--

-- hop
api.nvim_set_keymap("n", "<leader><leader>j", ":HopLineStart<CR>", noremap_opts)
api.nvim_set_keymap("n", "<leader><leader>w", ":HopWord<CR>", noremap_opts)
api.nvim_set_keymap("n", "<leader><leader>s", ":HopChar1<CR>", noremap_opts)
--

-- incsearch
let["incsearch#auto_nohlsearch"] = 1

api.nvim_set_keymap("n", "n", "<Plug>(incsearch-nohl-n)", {})
api.nvim_set_keymap("n", "N", "<Plug>(incsearch-nohl-N)", {})
api.nvim_set_keymap("n", "*", "<Plug>(incsearch-nohl-*)", {})
api.nvim_set_keymap("n", "#", "<Plug>(incsearch-nohl-#)", {})
api.nvim_set_keymap("n", "g*", "<Plug>(incsearch-nohl-g*)", {})
api.nvim_set_keymap("n", "g#", "<Plug>(incsearch-nohl-g#)", {})
--
