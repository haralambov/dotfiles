require("catppuccin").setup({
    flavour = "mocha",
    background = {
        dark = "mocha"
    },
    transparent_background = true
})

vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin"
