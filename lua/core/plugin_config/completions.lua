local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()
vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(), -- show suggestions
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- tab is confirm
  }),
  sources = cmp.config.sources {
    { name = "cmp_tabnine" },
    { name = 'path' },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 3 },
    { name = "luasnip", keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },

  formatting = {
      format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
      }),
  },

})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)