require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vim", "lua", "python"},
    highlight = {
      enable  = true,
      additional_vim_regex_highlighting = true
    },
    indent = { enable = true },
    autotag = { enable = true },
    auto_install = true,
    -- rainbow brackets
    rainbow = {
      enable = true,
      query = 'rainbow-parens',
      strategy = require('ts-rainbow').strategy.global,
    }
}
