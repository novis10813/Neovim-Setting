local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
    },
    sections = {
        lualine_a = {
            {
                "filename",
                path = 1,
            },
        },
        lualine_x = {
            {
                require("lazy.status").updates,
                cond = require("lazy.status").has_updates,
                color = { fg = "ff9e64" },
            },
        },
    },
})
