local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	-- lua functions that many plugins
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	-- icons for many projects
	"nvim-tree/nvim-web-devicons",
	-- colors of the words for different programming language
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	-- the theme
	"ellisonleao/gruvbox.nvim",
	-- colorizer
	"NvChad/nvim-colorizer.lua",
	--tree on the left
	"nvim-tree/nvim-tree.lua",
	--status bar below
	"nvim-lualine/lualine.nvim",
	-- lsp progress
	{ "j-hui/fidget.nvim", branch = "legacy" },
	--lsp server
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	--semantic tokens
	"theHamsta/nvim-semantic-tokens",
	-- Diagnostics troubles
	"folke/trouble.nvim",
	-- configuring lsp servers
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"onsails/lspkind.nvim",
	-- auto completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"lukas-reineke/cmp-under-comparator",
	-- snippet engine
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	-- snippets of vscode
	"rafamadriz/friendly-snippets",
	-- tabnine
	{ "tzachar/cmp-tabnine", build = "./install.sh" },
	-- codeium
	"Exafunction/codeium.vim",
	-- auto pairs
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	-- rainbow brackets
	"HiPhish/nvim-ts-rainbow2",
	-- surround
	{ "kylechui/nvim-surround", version = "*" },
	-- toggler for true and false
	"rmagatti/alternate-toggler",
	-- indent
	"lukas-reineke/indent-blankline.nvim",
	--smooth scroll
	"karb94/neoscroll.nvim",
	-- leap
	"ggandor/leap.nvim",
	-- which key
	"folke/which-key.nvim",
	-- tmux
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	-- commenting with gc
	"numToStr/Comment.nvim",
	-- Telescope
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	-- Telescope extensions
	-- fzf
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- select ui
	"nvim-telescope/telescope-ui-select.nvim",
	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	-- git signs
	"lewis6991/gitsigns.nvim",
	-- cursorline
	"yamatsum/nvim-cursorline",
	-- jupyter
	"luk400/vim-jukit",
	-- bufferline
	"akinsho/bufferline.nvim",
	-- close buffer
	"moll/vim-bbye",
	-- dashboard
	"goolord/alpha-nvim",
	-- terminal
	"voldikss/vim-floaterm",
	-- lazygit integration
	"kdheepak/lazygit.nvim",
	-- select virtual environment for python
	"AckslD/swenv.nvim",
	-- move line and block up and down
	"matze/vim-move",
	-- better w,e,b
	"chrisgrieser/nvim-spider",
})
