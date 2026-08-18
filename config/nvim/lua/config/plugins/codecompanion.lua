require("codecompanion").setup({
    adapters = {
        http = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        url = "http://192.168.1.22:11434",
                    },
                    schema = {
                        model = {
                            default = "deepseek-go",
                        },
                    },
                })
            end,
        },
    },

    interactions = {
        chat = {
            adapter = "ollama",
        },

        inline = {
            adapter = "ollama",
        },
    },
})
