local api = vim.api
local fn = vim.fn

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = { enable = true },
	indent = { enable = true },
	matchup = { enable = true },
	textobjects = {
		lsp_interop = { enable = true },
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["ab"] = "@block.outer",
				["ac"] = "@class.outer",
				["af"] = "@function.outer",
				["ak"] = "@comment.outer",
				["al"] = "@loop.outer",
				["ap"] = "@parameter.outer",
				["ib"] = "@block.inner",
				["ic"] = "@class.inner",
				["if"] = "@function.inner",
				["il"] = "@loop.inner",
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

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		api.nvim_buf_set_option(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

  -- navigation
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<leader>lgr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>lgt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  --

  -- workspace
	buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>lws", "<cmd>lua vim.inspect(vim.lsp.buf.workspace_symbol())<CR>", opts)
  --

  -- code action
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  --

  -- diagnostic
	buf_set_keymap("n", "<leader>lee", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<leader>leq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  --
end

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"diagnosticls",
	"dockerls",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"terraformls",
	"vimls",
	"vuels",
	"yamlls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

lspconfig.diagnosticls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	init_options = {
		filetypes = {
			javascript = "eslint",
			javascriptreact = "eslint",
			typescript = "eslint",
			typescriptreact = "eslint",
		},
		formatFiletypes = {
			css = "prettier",
			html = "prettier",
			javascript = "prettier",
			javascriptreact = "prettier",
			markdown = "prettier",
			scss = "prettier",
			typescript = "prettier",
			typescriptreact = "prettier",
			yaml = "prettier",
		},
		linters = {
			eslint = {
				command = "eslint",
				args = {
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json",
				},
				sourceName = "eslint",
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "${message} [${ruleId}]",
					security = "severity",
				},
				securities = {
					[1] = "warning",
					[2] = "error",
				},
			},
		},
		formatters = {
			prettier = {
				command = "prettier",
				args = {
					"--stdin-filepath",
					"%filepath",
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
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if fn.pumvisible() == 1 then
				fn.feedkeys(api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			elseif luasnip.expand_or_jumpable() then
				fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if fn.pumvisible() == 1 then
				fn.feedkeys(api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
			elseif luasnip.jumpable(-1) then
				fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})
--
