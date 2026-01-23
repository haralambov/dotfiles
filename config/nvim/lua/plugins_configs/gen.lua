require("gen").setup({
    model = "qwen3-coder",
    host = "ai.local",
    port = "11434",

    display_mode = "vertical-split",
    show_prompt = false,
    show_model = true,
    no_auto_close = false,

    init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
})

vim.keymap.set({ "n", "v" }, "<leader>oa", ":Gen<CR>", { silent = true })
