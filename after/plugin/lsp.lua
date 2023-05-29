local lsp = require('lsp-zero').preset({})

lsp.preset('recommended')
lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'html',
    'zls'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { remap = false, buffer = bufnr }
    -- lsp.default_keymaps({buffer = bufnr})
    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    vim.keymap.set("n", "<leader>vd", ":lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_next()<CR>", opts)
    vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set("n", "<leader>vrn", ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)
    vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<leader>so", ":SymbolsOutline<CR>", opts)
    vim.keymap.set("n", "<leader>sc", ":SymbolsOutlineClose<CR>", opts)
end)


lsp.setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functionsh

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = true,
    float = {
        show_header = true,
        source = 'if_many',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = true, -- default to false
    severity_sort = true,    -- default to false
})

vim.g.symbols_outline = {
    highlight_hovered_item = false,
    auto_preview = false,
    position = 'left',
    auto_close = true
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp_action.luasnip_jump_backward(),
        ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<TAB>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "path" },
        { name = "buffer",  keyword_length = 3 }
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    }
})


require('kommentary.config').use_extended_mappings()
