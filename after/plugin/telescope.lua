local telescope = require('telescope')
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local builtin = require('telescope.builtin')

telescope.setup {
    defaults = {
        path_display = {
            truncate = true,
            shorten = 2
        },
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        }
    }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<C-e>', builtin.oldfiles, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-M-f>', function()
    local search = vim.fn.getreg("/")
    search = string.gsub(search, "\\<", "")
    search = string.gsub(search, "\\>", "")
    builtin.grep_string({ search = search })
end)
vim.keymap.set('n', '<leader>bu', builtin.buffers, {})
