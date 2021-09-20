local nvim_treesitter_configs = require("nvim-treesitter.configs")
local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig.util")
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspkind = require("lspkind")

local ide = {}

function ide.setup()
	ide.setup_ts()
	ide.setup_lsp_config()
	ide.setup_cmp()

	-- dap
	vim.g.dap_virtual_text = true
end

function ide.setup_ts()
	nvim_treesitter_configs.setup({
		ensure_installed = "maintained",
		autopairs = { enable = true },
		autotag = { enable = true },
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
		matchup = { enable = true },
		rainbow = { enable = true, extended_mode = true },
		textobjects = {
			lsp_interop = { enable = true },
			swap = { enable = true },
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
end

function ide.setup_lsp_config()
	local setup_lsp_config = function(lsp, config)
		config = config or {}

		local on_attach = function(bufnr)
			require("keymaps").buf_register(bufnr)
		end
		local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

		config.on_attach = on_attach
		config.capabilities = capabilities

		if lspconfig[lsp] then
			lspconfig[lsp].setup(config)
		end
	end

	local language_servers = {
		"ansiblels",
		"bashls",
		"cssls",
		"dartls",
		"dockerls",
		"gopls",
		"graphql",
		"html",
		"pyright",
		"rust_analyzer",
		"taplo",
		"terraformls",
		"vimls",
		"volar",
		"yamlls",
	}

	for _, lsp in ipairs(language_servers) do
		setup_lsp_config(lsp)
	end

	local json_schemas = {
		{
			fileMatch = { "tsconfig.json" },
			url = "https://json.schemastore.org/tsconfig",
		},
		{
			fileMatch = { "jsconfig.json" },
			url = "https://json.schemastore.org/jsconfig",
		},
		{
			fileMatch = { "package.json" },
			url = "https://json.schemastore.org/package",
		},
		{
			fileMatch = { ".commitlintrc" },
			url = "https://json.schemastore.org/commitlintrc",
		},
		{
			fileMatch = { ".huskyrc" },
			url = "https://json.schemastore.org/huskyrc",
		},
		{
			fileMatch = { "lerna.json" },
			url = "https://json.schemastore.org/lerna",
		},
		{
			fileMatch = { "nodemon.json" },
			url = "https://json.schemastore.org/nodemon",
		},
		{
			fileMatch = { "renovate.json" },
			url = "https://json.schemastore.org/renovate-schema",
		},
		{
			fileMatch = { ".babelrc" },
			url = "https://json.schemastore.org/babelrc",
		},
		{
			fileMatch = { ".eslintrc" },
			url = "https://json.schemastore.org/eslintrc",
		},
		{
			fileMatch = { ".prettierrc" },
			url = "https://json.schemastore.org/prettierrc",
		},
	}

	setup_lsp_config("jsonls", {
		settings = {
			json = {
				schemas = json_schemas,
			},
		},
		get_language_id = function(_, filetype)
			return filetype == "json" and "jsonc" or filetype
		end,
	})

	setup_lsp_config("tsserver", {
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})

	local sumneko_root_path = vim.env.HOME .. "/.sdk/lua-language-server"
	local sumneko_binary = sumneko_root_path .. "/bin/" .. "macOS" .. "/lua-language-server"

	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	setup_lsp_config("sumneko_lua", {
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})

	local eslint = {
		prefix = "eslint",
		lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
		lintStdin = true,
		lintFormats = { "%f:%l:%c: %m" },
		lintIgnoreExitCode = true,
		formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
		formatStdin = true,
	}

	local eslint_root_markers = {
		".eslintrc",
		".eslintrc.cjs",
		".eslintrc.js",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
		".git/",
		"package.json",
	}

	local eslint_languages = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

	local efm_eslint_languages = {}

	for _, language in ipairs(eslint_languages) do
		efm_eslint_languages[language] = { eslint }
	end

	setup_lsp_config("efm", {
		filetypes = eslint_languages,
		root_dir = function(fname)
			return lspconfig_util.root_pattern("tsconfig.json")(fname)
				or lspconfig_util.root_pattern(unpack(eslint_root_markers))(fname)
		end,
		init_options = { documentFormatting = true },
		settings = {
			rootMarkers = eslint_root_markers,
			languages = efm_eslint_languages,
		},
	})
end

function ide.setup_cmp()
	cmp.setup({
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
				return vim_item
			end,
		},
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-j>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "vsnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "nvim_lua" },
		},
	})
end

return ide
