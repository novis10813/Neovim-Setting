local setup, bufferline = pcall(require, "bufferline")
if not setup then
    return
end

bufferline.setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{
            filetype = "NvimTree",
            text = "File Explore",
            highlight = "Directory",
            text_align = "left",
        }}
    }
}
