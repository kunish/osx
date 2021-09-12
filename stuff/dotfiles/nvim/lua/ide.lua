local noremap_opts = { noremap = true, silent = true }

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	autopairs = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
	matchup = { enable = true },
	rainbow = { enable = true, extended_mode = true },
	textobjects = {
		lsp_interop = { enable = true },
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ak"] = "@comment.outer",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
		},
	},
})
--

-- lspconfig
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")

local on_attach = function(bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- navigation
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremap_opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lgt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", noremap_opts)
	--

	-- workspace
	buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", noremap_opts)
	buf_set_keymap(
		"n",
		"<leader>lwl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		noremap_opts
	)
	buf_set_keymap("n", "<leader>lws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", noremap_opts)
	--

	-- code action
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap_opts)
	--

	-- diagnostic
	buf_set_keymap("n", "<leader>lee", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", noremap_opts)
	buf_set_keymap("n", "<leader>leq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", noremap_opts)
	buf_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", noremap_opts)
	buf_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", noremap_opts)
	--
end

local language_servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"diagnosticls",
	"dockerls",
	"gopls",
	"graphql",
	"html",
	"pyright",
	"rust_analyzer",
	"terraformls",
	"vimls",
	"volar",
	"yamlls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, lsp in ipairs(language_servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.jsonls.setup({
	capabilities = capabilities,
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "tsconfig.json" },
					url = "https://json.schemastore.org/tsconfig",
				},
			},
		},
	},
	get_language_id = function(bufnr, filetype)
		if vim.tbl_contains({ "json" }, filetype) then
			return "jsonc"
		end
		return filetype
	end,
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	underline = true,
	update_in_insert = true,
	virtual_text = false,
})

lspconfig.diagnosticls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	init_options = {
		filetypes = {
			javascript = "eslint",
			javascriptreact = "eslint",
			typescript = "eslint",
			typescriptreact = "eslint",
		},
		linters = {
			eslint = {
				command = "./node_modules/.bin/eslint",
				args = {
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json",
				},
				debounce = 100,
				sourceName = "eslint",
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "[eslint] ${message} [${ruleId}]",
					security = "severity",
				},
				securities = {
					[1] = "warning",
					[2] = "error",
				},
			},
		},
	},
})
--

-- cmp
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-j>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
	},
})
--

-- dap
require("telescope").load_extension("dap")

vim.g.dap_virtual_text = true

vim.api.nvim_set_keymap("n", "<Leader>da", "<cmd>Telescope dap commands<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>dc", "<cmd>Telescope dap configurations<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>dd", "<cmd>lua require'dap'.continue()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>lua require'dap'.step_into()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>do", "<cmd>lua require'dap'.step_out()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>dO", "<cmd>lua require'dap'.step_over()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", noremap_opts)
vim.api.nvim_set_keymap("n", "<Leader>dl", "<cmd>lua require'dap'.run_last()<CR>", noremap_opts)
--

-- neoformat
vim.g["neoformat_basic_format_align"] = 1
vim.g["neoformat_basic_format_retab"] = 1
vim.g["neoformat_basic_format_trim"] = 1
vim.g["neoformat_try_node_exe"] = 1

vim.api.nvim_set_keymap("n", "<Leader>p", "<cmd>Neoformat<CR>", noremap_opts)
--
