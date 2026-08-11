vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

vim.lsp.enable({
    'lua_ls',
    'gopls',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local opts = { buffer = ev.buf }

        -- LSP navigation
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- LSP actions
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        -- Formatting
        vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        -- Completion
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })

            vim.keymap.set('i', '<CR>', function()
                return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
            end, { expr = true, buffer = ev.buf })

            vim.keymap.set('i', '<Tab>', function()
                return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
            end, { expr = true, buffer = ev.buf })

            vim.keymap.set('i', '<S-Tab>', function()
                return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
            end, { expr = true, buffer = ev.buf })
        end

        -- Inlay hints
        vim.keymap.set('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
                { bufnr = ev.buf }
            )
        end, { buffer = ev.buf, desc = 'Toggle inlay hints' })
    end,
})

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,

    float = {
        border = 'rounded',
        source = 'if_many',
    },

    underline = true,

    virtual_text = {
        spacing = 2,
        source = 'if_many',
        prefix = '●',
    },

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.INFO] = '»',
            [vim.diagnostic.severity.HINT] = '⚑',
        },
    },
})
