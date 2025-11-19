local lsp_zero = require('lsp-zero')

if lsp_zero.extend_lspconfig then
    lsp_zero.extend_lspconfig()
end

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            if server_name == 'vue_ls' or server_name == 'vtsls' then
                return
            end
            lsp_zero.default_setup(server_name)
        end,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            vim.lsp.config('lua_ls',lua_opts)
            vim.lsp.enable('lua_ls')
        end,
    },
})

local capabilities = lsp_zero.get_capabilities
and lsp_zero.get_capabilities()
or nil

local vue_language_server_path =
vim.fn.stdpath('data')
.. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

vim.lsp.config('vtsls', {
    on_attach = lsp_zero.on_attach,
    capabilities = capabilities,
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue',
    },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = { vue_plugin },
            },
        },
    },
})
vim.lsp.enable('vtsls')

vim.lsp.config('vue_ls',{
    on_attach = lsp_zero.on_attach,
    capabilities = capabilities,
    filetypes = { 'vue' },
})
vim.lsp.enable('vue_ls')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),

        ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
