local opt = vim.opt

opt.backspace = "2"
opt.showcmd = true
opt.laststatus = 4
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
-- opt.backspace = indent,eol,start

opt.wrap = false
-- search
opt.ignorecase = true
opt.smartcase = true

-- indent
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

--clipboard
opt.clipboard:append('unnamedplus')

-- split window
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append('-')

-- appearance   
opt.termguicolors = true
opt.background = "dark"
