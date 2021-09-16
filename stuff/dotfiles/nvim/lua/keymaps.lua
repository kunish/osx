local keymaps = {}

local noremap_opts = { noremap = true, silent = true }

function keymaps.setup()
	local set_keymap = vim.api.nvim_set_keymap

	-- barbar
	set_keymap("n", "<Leader>bb", "<cmd>BufferPick<CR>", noremap_opts)
	set_keymap("n", "<Leader>bo", "<cmd>BufferOrderByBufferNumber<CR>", noremap_opts)
	set_keymap("n", "<Leader>bh", "<cmd>BufferMovePrevious<CR>", noremap_opts)
	set_keymap("n", "<Leader>bl", "<cmd>BufferMoveNext<CR>", noremap_opts)
	set_keymap("n", "<Leader>bC", "<cmd>BufferClose<CR>", noremap_opts)
	set_keymap("n", "<Leader>bO", "<cmd>BufferCloseAllButCurrent<CR>", noremap_opts)
	set_keymap("n", "<Leader>bH", "<cmd>BufferCloseBuffersLeft<CR>", noremap_opts)
	set_keymap("n", "<Leader>bL", "<cmd>BufferCloseBuffersRight<CR>", noremap_opts)
	set_keymap("n", "<Tab>", "<cmd>BufferNext<CR>", noremap_opts)
	set_keymap("n", "<S-tab>", "<cmd>BufferPrevious<CR>", noremap_opts)

	-- telescope
	set_keymap("n", "q:", "<cmd>Telescope command_history<CR>", noremap_opts)
	set_keymap("n", "q?", "<cmd>Telescope search_history<CR>", noremap_opts)
	set_keymap("n", "<Leader>bs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", noremap_opts)
	set_keymap("n", "<Leader>fa", "<cmd>Telescope builtin<CR>", noremap_opts)
	set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", noremap_opts)
	set_keymap("n", "<Leader>fe", "<cmd>Telescope emoji<CR>", noremap_opts)
	set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", noremap_opts)
	set_keymap("n", "<Leader>fg", "<cmd>Telescope git_status<CR>", noremap_opts)
	set_keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", noremap_opts)
	set_keymap("n", "<Leader>fj", "<cmd>Telescope jumplist<CR>", noremap_opts)
	set_keymap("n", "<Leader>fl", "<cmd>Telescope file_browser<CR>", noremap_opts)
	set_keymap("n", "<Leader>fm", "<cmd>Telescope man_pages<CR>", noremap_opts)
	set_keymap("n", "<Leader>fs", "<cmd>Telescope live_grep<CR>", noremap_opts)

	-- nvimtree
	set_keymap("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", noremap_opts)

	-- hop
	set_keymap("n", "<Leader><Leader><Leader>", "<cmd>HopLineStart<CR>", noremap_opts)
	set_keymap("n", "<Leader><Leader>w", "<cmd>HopWord<CR>", noremap_opts)
	set_keymap("n", "<Leader><Leader>s", "<cmd>HopChar1<CR>", noremap_opts)

	-- fugitive
	set_keymap("n", "<Leader>gg", "<cmd>Git<CR>", noremap_opts)
	set_keymap("n", "<Leader>gb", "<cmd>Git blame<CR>", noremap_opts)
	set_keymap("n", "<Leader>gd", "<cmd>Gvdiffsplit!<CR>", noremap_opts)
	set_keymap("n", "<Leader>gp", "<cmd>Git pull<CR>", noremap_opts)
	set_keymap("n", "<Leader>gP", "<cmd>Git push<CR>", noremap_opts)

	-- incsearch
	set_keymap("n", "n", "<Plug>(incsearch-nohl-n)", {})
	set_keymap("n", "N", "<Plug>(incsearch-nohl-N)", {})
	set_keymap("n", "*", "<Plug>(incsearch-nohl-*)", {})
	set_keymap("n", "#", "<Plug>(incsearch-nohl-#)", {})
	set_keymap("n", "g*", "<Plug>(incsearch-nohl-g*)", {})
	set_keymap("n", "g#", "<Plug>(incsearch-nohl-g#)", {})

	-- dap
	set_keymap("n", "<Leader>da", "<cmd>Telescope dap commands<CR>", noremap_opts)
	set_keymap("n", "<Leader>dc", "<cmd>Telescope dap configurations<CR>", noremap_opts)
	set_keymap("n", "<Leader>dd", "<cmd>lua require'dap'.continue()<CR>", noremap_opts)
	set_keymap("n", "<Leader>di", "<cmd>lua require'dap'.step_into()<CR>", noremap_opts)
	set_keymap("n", "<Leader>do", "<cmd>lua require'dap'.step_out()<CR>", noremap_opts)
	set_keymap("n", "<Leader>dO", "<cmd>lua require'dap'.step_over()<CR>", noremap_opts)
	set_keymap("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", noremap_opts)
	set_keymap("n", "<Leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", noremap_opts)
	set_keymap("n", "<Leader>dl", "<cmd>lua require'dap'.run_last()<CR>", noremap_opts)

	-- neoformat
	set_keymap("n", "<Leader>p", "<cmd>Neoformat<CR>", noremap_opts)

	-- custom
	set_keymap("n", "<C-S>", "<cmd>write<CR>", noremap_opts)
	set_keymap("n", "<C-H>", "<cmd>wincmd h<CR>", noremap_opts)
	set_keymap("n", "<C-J>", "<cmd>wincmd j<CR>", noremap_opts)
	set_keymap("n", "<C-K>", "<cmd>wincmd k<CR>", noremap_opts)
	set_keymap("n", "<C-L>", "<cmd>wincmd l<CR>", noremap_opts)
	set_keymap("i", "<C-A>", "<C-O>^", noremap_opts)
	set_keymap("i", "<C-E>", "<C-O>$", noremap_opts)
end

function keymaps.buf_register(bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- ide navigation
	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", noremap_opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgr", "<cmd>Telescope lsp_references<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgi", "<cmd>Telescope lsp_implementations<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgt", "<cmd>Telescope lsp_type_definitions<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgs", "<cmd>Telescope lsp_document_symbols<CR>", noremap_opts)

	-- ide workspace
	buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lws", "<cmd>Telescope lsp_workspace_symbols<CR>", noremap_opts)
	buf_set_keymap(
		"n",
		"<leader>lwl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		noremap_opts
	)

	-- ide code_action
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>la", "<cmd>Telescope lsp_code_actions<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap_opts)

	-- ide diagnostic
	buf_set_keymap("n", "<leader>lee", "<cmd>Telescope lsp_document_diagnostics<CR>", noremap_opts)
	buf_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", noremap_opts)
	buf_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", noremap_opts)
end

return keymaps
