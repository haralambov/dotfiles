local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function(client, buffnr)
    local opts = { buffer = buffnr, remap = false }

    vim.keymap.set('n', '<leader>L', function() vim.diagnostic.setloclist() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, bufopts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, bufopts)
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, bufopts)
end)

lsp.setup()


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
