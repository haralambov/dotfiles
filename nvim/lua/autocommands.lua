vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
