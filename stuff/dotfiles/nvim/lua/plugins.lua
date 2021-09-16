local plugins = {}

function plugins.setup()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
	end

	require("paq")({
		-- essential
		"savq/paq-nvim",
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",

		-- interface
		"gruvbox-community/gruvbox",
		"kyazdani42/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"romgrk/barbar.nvim",
		"kyazdani42/nvim-tree.lua",
		"hoob3rt/lualine.nvim",
		"norcalli/nvim-colorizer.lua",
		"theHamsta/nvim-dap-virtual-text",

		-- tool
		"folke/which-key.nvim",
		"tpope/vim-surround",
		"haya14busa/incsearch.vim",
		"houtsnip/vim-emacscommandline",
		"ntpeters/vim-better-whitespace",
		"nvim-telescope/telescope.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-dap.nvim",
		"windwp/nvim-ts-autotag",
		"xiyaowong/telescope-emoji.nvim",
		"phaazon/hop.nvim",
		"terrortylor/nvim-comment",
		"tpope/vim-fugitive",
		"tpope/vim-repeat",
		"vim-scripts/ReplaceWithRegister",
		"vim-scripts/undotree.vim",
		"windwp/nvim-autopairs",

		-- ide
		"neovim/nvim-lspconfig",
		{
			"nvim-treesitter/nvim-treesitter",
			run = function()
				vim.cmd("TSUpdate")
			end,
		},
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"andymass/vim-matchup",
		"p00f/nvim-ts-rainbow",
		"mattn/emmet-vim",
		"sbdchd/neoformat",
		"mfussenegger/nvim-dap",
	})
end

return plugins
