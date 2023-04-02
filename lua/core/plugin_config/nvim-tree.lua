vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    hijack_cursor = true,
    view = {
        width = 25,
        preserve_window_proportions = true,
        mappings = {
            list = {
                {key="u", action="dir_up"},
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

-- o:open files
-- a:create files
-- r:rename files
-- c:copy files
-- d:delete files
-- p:paste files
