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
    {
        "nvim-lua/popup.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- colors of the words for different programming language
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("plugins/treesitter")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "HiPhish/nvim-ts-rainbow2",
            "windwp/nvim-ts-autotag",
            {
                "abecodes/tabout.nvim",
                config = function()
                    require("plugins/tabout")
                end,
            },
        },
    },
    -- the theme
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
            require("plugins/colorscheme")
        end,
    },
    -- colorizer
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    --tree on the left
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.g.loaded_newrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("plugins/nvim-tree")
        end,
    },
    --status bar below
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins/lualine")
        end,
    },
    --lsp server
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("plugins/lsp/mason")
            require("plugins/lsp/lsp_config")
        end,
    },
    -- configuring lsp servers
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            -- formatting & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
        },
        config = function()
            require("plugins/lsp/null-ls")
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("plugins/lsp/lspsaga")
        end,
    },
    -- lsp progress
    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("plugins/lsp/fidget")
        end,
    },
    -- Diagnostics troubles
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins/lsp/trouble")
        end,
    },
    --semantic tokens
    {
        "theHamsta/nvim-semantic-tokens",
        opts = {
            preset = "default",
        },
    },
    -- auto completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("plugins/completions")
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            { "tzachar/cmp-tabnine", build = "./install.sh" },
            "lukas-reineke/cmp-under-comparator",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
    },
    -- snippet engine
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- codeium
    {
        "Exafunction/codeium.vim",
        event = "InsertEnter",
        config = function()
            vim.g.codeium_disble_bindings = 1
        end,
    },
    -- auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins/autopairs")
        end,
    },
    -- surround
    {
        "kylechui/nvim-surround",
        version = "*",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    -- toggler for true and false
    {
        "rmagatti/alternate-toggler",
        config = function()
            require("alternate-toggler").setup({})
        end,
    },
    -- indent
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("plugins/indent")
        end,
    },
    --smooth scroll
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("plugins/smoothscroll")
        end,
    },
    -- leap
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    -- which key
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
        lazy = true,
    },
    -- tmux
    { "christoomey/vim-tmux-navigator" },
    { "szw/vim-maximizer" },
    -- commenting with gc
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("plugins/telescope")
        end,
    },
    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- cursorline
    {
        "yamatsum/nvim-cursorline",
        opts = {
            cursorline = {
                enable = true,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = { underline = true },
            },
        },
    },
    -- jupyter
    { "luk400/vim-jukit", ft = "python" },
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explore",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },
    -- close buffer
    { "moll/vim-bbye" },
    -- dashboard
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins/alpha")
        end,
    },
    -- terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugins/toggleterm")
        end,
    },
    -- cmdline
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("plugins/noice")
        end,
    },
    -- lazygit integration
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- select virtual environment for python
    {
        "AckslD/swenv.nvim",
        ft = "python",
    },
    -- move line and block up and down
    { "matze/vim-move" },
    -- better w,e,b
    {
        "chrisgrieser/nvim-spider",
        opts = {
            skipInsignificantPunctuation = false,
        },
    },
    -- cmake for C
    {
        "Civitasv/cmake-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = { "c", "cpp", "cmake" },
        config = function()
            require("plugins/cmake-tools")
        end,
    },
})
