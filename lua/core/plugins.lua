local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- lua functions that many plugins use
  use('nvim-lua/plenary.nvim')
  -- the theme
  use 'ellisonleao/gruvbox.nvim'

  --tree on the left
  use 'nvim-tree/nvim-tree.lua'

  --color of the words for different programming language
  use { 'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  --status bar below
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true } -- customize icon
  }
  --lsp server
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  -- configuring lsp servers
  use({"glepnir/lspsaga.nvim", branch = "main"})
  use 'onsails/lspkind.nvim'
  -- auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- snippet engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- tabnine
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  -- auto pairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- rainbow brackets
  use 'HiPhish/nvim-ts-rainbow2'
  -- indent
  use "lukas-reineke/indent-blankline.nvim"
  --smooth scroll
  use 'karb94/neoscroll.nvim'
  -- which key
  use 'folke/which-key.nvim'
  -- tmux
  use ("christoomey/vim-tmux-navigator")
  use ("szw/vim-maximizer")
  -- commenting with gc
  use ('numToStr/Comment.nvim')
  -- fuzzy finding
  use({"nvim-telescope/telescope-fzf-native.nvim", run="make"})
  use({'nvim-telescope/telescope.nvim', branch = '0.1.x'})

  -- formatting & linting
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  -- git signs
  use 'lewis6991/gitsigns.nvim'
  -- cursorline
  use 'yamatsum/nvim-cursorline'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
