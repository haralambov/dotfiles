function onSaveActions()
    vim.api.nvim_command('lua vim.lsp.buf.format()')
    vim.api.nvim_command('lua vim.lsp.buf.code_action({apply=true, context={only={"source.organizeImports"}}})')
end

vim.api.nvim_exec([[
  augroup OnSaveCmdGroup
    autocmd!
    autocmd BufWritePre *.go lua onSaveActions()
  augroup END
]], false)
