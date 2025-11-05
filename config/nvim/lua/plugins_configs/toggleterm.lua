require("toggleterm").setup({
    insert_mappings = false
})

--  Mapping for toggling the terminal
vim.keymap.set('n', '<C-t>', [[<Cmd>ToggleTerm<CR>]])
vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]])
