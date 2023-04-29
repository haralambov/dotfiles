require("nvim-tree").setup({
    update_focused_file = {
        enable = true
    },
    view = {
        side = "left",
        width = 35,
        relativenumber = true
    }
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
