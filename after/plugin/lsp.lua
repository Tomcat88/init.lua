local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        'tsserver',
        'lua_ls',
        'zls',
        'clojure_lsp',
        'gopls',
        'terraformls',
        'lua_ls',
        'templ',
    },
    handlers = {
        lsp.default_setup,
    }
})

-- Fix Undefined global 'vim'
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig.htmx.setup {
    filetypes = { "html", "templ" },
}

lspconfig.tailwindcss.setup {
    filetypes = { "templ", "astro", "javascript", "typescript", "react" },
    init_options = { userLanguages = { templ = "html" } },
}

lsp.on_attach(function(_, bufnr)
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

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })


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
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 3 },
        { name = "codeium" },
        { name = "gitmoji" }
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<TAB>'] = cmp.mapping.confirm({ select = true })
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = lsp.cmp_format({ details = false })
})


require('kommentary.config').use_extended_mappings()
