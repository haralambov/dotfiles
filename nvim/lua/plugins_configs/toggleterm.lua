require("toggleterm").setup({
    insert_mappings = false
})

--  Mapping for toggling the terminal
vim.keymap.set('n', '<leader><CR>', [[<Cmd>ToggleTerm<CR>]])
vim.keymap.set('t', '<leader><CR>', [[<Cmd>ToggleTerm<CR>]])
