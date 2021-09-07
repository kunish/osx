require("packer").startup(function()
	use("editorconfig/editorconfig-vim")
	use("haya14busa/incsearch.vim")
	use("honza/vim-snippets")
	use("houtsnip/vim-emacscommandline")
	use("jiangmiao/auto-pairs")
	use("machakann/vim-highlightedyank")
	use("mattn/emmet-vim")
	use("morhetz/gruvbox")
	use("ntpeters/vim-better-whitespace")
	use("terryma/vim-multiple-cursors")
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-sensible")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("vim-scripts/ReplaceWithRegister")
	use("vim-scripts/undotree.vim")
	use("airblade/vim-gitgutter")

	use("wbthomason/packer.nvim")
	use("folke/which-key.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("phaazon/hop.nvim")
	use("hoob3rt/lualine.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("neovim/nvim-lspconfig")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("andymass/vim-matchup")
end)
