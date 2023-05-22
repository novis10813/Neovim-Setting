local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	-- icons for many projects
	use("nvim-tree/nvim-web-devicons")
	-- colors of the words for different programming language
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- the theme
	use("ellisonleao/gruvbox.nvim")
	-- colorizer
	use("NvChad/nvim-colorizer.lua")
	--tree on the left
	use("nvim-tree/nvim-tree.lua")
	--status bar below
	use("nvim-lualine/lualine.nvim")
	-- lsp progress
	use("arkav/lualine-lsp-progress")
	--lsp server
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	-- configuring lsp servers
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")
	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	-- snippet engine
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- snippets of vscode
	use("rafamadriz/friendly-snippets")
	-- tabnine
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	-- codeium
	use("Exafunction/codeium.vim")
	-- auto pairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	-- rainbow brackets
	use("HiPhish/nvim-ts-rainbow2")
	-- surround
	use("kylechui/nvim-surround")
	-- toggler for true and false
	use("rmagatti/alternate-toggler")
	-- multiline
	use({ "mg979/vim-visual-multi", branch = "master" })
	-- indent
	use("lukas-reineke/indent-blankline.nvim")
	--smooth scroll
	use("karb94/neoscroll.nvim")
	-- leap
	use("ggandor/leap.nvim")
	-- which key
	use("folke/which-key.nvim")
	-- tmux
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	-- commenting with gc
	use("numToStr/Comment.nvim")
	-- Telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	-- Telescope extensions
	-- fzf
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	-- git signs
	use("lewis6991/gitsigns.nvim")
	-- cursorline
	use("yamatsum/nvim-cursorline")
	-- jupyter
	use("luk400/vim-jukit")
	-- bufferline
	use("akinsho/bufferline.nvim")
	-- close buffer
	use("moll/vim-bbye")
	-- tabout
	use({ "abecodes/tabout.nvim", require = { "nvim-treesitter" } })
	-- dashboard
	use("goolord/alpha-nvim")
	-- terminal
	use("voldikss/vim-floaterm")
	-- lazygit integration
	use("kdheepak/lazygit.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
