vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        local ft = vim.bo.filetype

        if ft == 'go' then
            vim.lsp.buf.code_action({
                apply = true,
                context = { only = { 'source.organizeImports' } },
            })
            vim.lsp.buf.format({ async = false })
            return
        end

        -- default for everything else
        vim.lsp.buf.format({ async = false })
    end,
})
