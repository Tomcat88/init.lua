
require("which-key").setup {
    triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    n = { "/", "<leader>" },
    v = { "j", "k" },
  },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
