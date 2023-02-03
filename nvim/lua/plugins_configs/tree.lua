require("nvim-tree").setup({
    update_focused_file = {
        enable = true
    },
    view = {
        side = "left",
        width = 35
    }
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
