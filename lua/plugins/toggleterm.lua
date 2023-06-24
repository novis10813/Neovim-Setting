local toggle_term_status, toggle_term = pcall(require, "toggleterm")
if not toggle_term_status then
    return
end

toggle_term.setup({
    open_mapping = [[<F12>]],
    direction = "float",
    terminal_mappings = true,
    border = "single",
})
