local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-Y>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })


local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")


ls.add_snippets("typescriptreact", {
    s("imre", { t("import React from 'react';") }),
    s("fc", fmt([[
    interface {}Props {{
        {}
    }}

    export const {}: React.FC<{}Props> = ({{ {} }}) => {{
        return (
            <{}>
                {}
            </{}>
        );
    }}
    ]],
        { i(1), i(2), rep(1), rep(1), i(3), c(4, { i(), t "div" }), i(5, "Hello"), rep(4) }
    )),
    s("ust",
        fmt("const [{}, set{}] = React.useState{}({});",
            {
                i(1),
                f(
                    function(args)
                        local state = args[1][1]
                        return state:sub(1, 1):upper() .. state:sub(2)
                    end,
                    { 1 }
                ),
                c(2, { t "", sn(nil, { t "<", i(1), t ">" }) }),
                c(3, { t "", t "\"\"", t "true", t "false", t "null", i() })
            }
        )
    )
})
