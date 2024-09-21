local tree_width = 35

function ToggleNvimTree()
    local view = require("nvim-tree.view")
    if view.is_visible() then
        tree_width = vim.api.nvim_win_get_width(view.get_winnr())
        vim.cmd("NvimTreeToggle")
    else
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true
            },
            view = {
                side = "left",
                width = tree_width,
                number = true,
                relativenumber = true
            }
        })
        vim.cmd("NvimTreeToggle")
        vim.cmd("wincmd p")
    end
end

vim.keymap.set('n', '<C-n>', ':lua ToggleNvimTree()<CR>', { noremap = true })
