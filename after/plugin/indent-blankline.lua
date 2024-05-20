-- vim.opt.list = false
-- vim.opt.listchars:append "space:⋅"

require("ibl").setup {
    debounce = 500,
    scope = {
        enabled = true,
        show_start = false,
        show_end = false
    },
    whitespace = { highlight = { "Whitespace", "NonText" } },
}
