local setup, webdevicon = pcall(require, "nvim-web-devicons")
if not setup then
    return
end

webdevicon.setup = {}
