local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" }
    }
})

local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
autopairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
