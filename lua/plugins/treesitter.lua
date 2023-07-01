local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
    return
end
treesitter.setup({
    ensure_installed = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    autotag = { enable = true },
    auto_install = false,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = false,
            node_decremental = "<BS>",
        },
    },
    -- rainbow brackets
    rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow").strategy.global,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
            selection_modes = {
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@class.outer"] = "<c-v>",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = { query = "@function.outer", desc = "Next function start" },
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
                ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
                ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
                ["]g"] = { query = "@comment.outer", desc = "Next Comment" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                -- ["]o"] = "@loop.*",
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]F"] = { query = "@function.outer", desc = "Next function end" },
                ["]C"] = { query = "@class.outer", desc = "Next class end" },
                ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                -- ["]A"] = { query = "@parameter.outer", desc = "Next argument end" },
            },
            goto_previous_start = {
                ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                ["[c"] = { query = "@class.outer", desc = "Previous class start" },
                ["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
                ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
                ["[g"] = { query = "@comment.outer", desc = "Previous Comment" },
            },
            goto_previous_end = {
                ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                ["[C"] = { query = "@class.outer", desc = "Previous class end" },
                ["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
                -- ["[A"] = { query = "@parameter.outer", desc = "Previous argument end" },
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
                ["]d"] = "@conditional.outer",
            },
            goto_previous = {
                ["[d"] = "@conditional.outer",
            },
        },
    },
})
