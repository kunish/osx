local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

require("paq")({
	"savq/paq-nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",

	"gruvbox-community/gruvbox",
	"haya14busa/incsearch.vim",
	"houtsnip/vim-emacscommandline",
	"windwp/nvim-autopairs",
	"machakann/vim-highlightedyank",
	"ntpeters/vim-better-whitespace",
	"terryma/vim-multiple-cursors",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"vim-scripts/undotree.vim",

	"folke/which-key.nvim",
	"kyazdani42/nvim-web-devicons",
	"phaazon/hop.nvim",
	"hoob3rt/lualine.nvim",
	"kyazdani42/nvim-tree.lua",
	"nvim-telescope/telescope.nvim",
	"lewis6991/gitsigns.nvim",
	"romgrk/barbar.nvim",
	"terrortylor/nvim-comment",

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
	"puremourning/vimspector",
	"sbdchd/neoformat",
})
