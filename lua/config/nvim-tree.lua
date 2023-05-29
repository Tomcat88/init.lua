--[[ require'nvim-tree'.setup {
    view = {
        adaptive_size = true,
        side = "left",
        width = 30
    },
    filters = { custom = { "^.git$" } }
}

vim.keymap.set("", "<F2>", ":NvimTreeFindFileToggle<CR>") ]]
