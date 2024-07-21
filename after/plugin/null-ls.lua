local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.stylelint
    }
})

--[[ eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
}) ]]
