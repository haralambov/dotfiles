require("nvim-tree").setup({
    update_focused_file = {
        enable = true
    },
    view = {
        side = "left",
        width = 35,
        number = true,
        relativenumber = true
    }
})

vim.keymap.set('n', '<C-_>', ':NvimTreeToggle<CR>', { noremap = true })
