function CreateNoremap(type, opts)
    return function(lhs, rhs, bufnr)
        bufnr = bufnr or 0
        vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
    end
end

function CreateMap(lhs, rhs, opts)
    vim.api.nvim_set_keymap('', lhs, rhs, opts)
end

Map = function(lhs, rhs)
    CreateMap(lhs, rhs, {})
end

Nnoremap = CreateNoremap("n", { noremap = true })
Inoremap = CreateNoremap("i", { noremap = true })

require('config.set')
require("config.packer")
require('config.remaps')
require("config.cmp")
require("config.eslint")
require("config.gitsigns")
require("config.nvim-tree")
require("config.surround")
require("config.trouble")
require("config.which-key")
