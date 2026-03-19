return {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
        require("codecompanion").setup({
            interactions = {
                chat = {
                    adapter = "opencode",
                    model = "gpt-5.3-codex",
                    keymaps = {
                        send = {
                            modes = { n = "<C-s>", i = "<C-s>" },
                            opts = {},
                        },
                        close = {
                            modes = { n = "gq", i = "C-x" },
                            opts = {},
                        },
                    },
                },
            },
            rules = {
                default = {
                    description = "Collection of common files for all projects",
                    files = {
                        ".clinerules",
                        ".cursorrules",
                        ".cursor",
                        ".goosehints",
                        ".rules",
                        ".windsurfrules",
                        ".github/copilot-instructions.md",
                        "AGENT.md",
                        "AGENTS.md",
                        { path = "CLAUDE.md", parser = "claude" },
                        { path = "CLAUDE.local.md", parser = "claude" },
                        { path = "~/.claude/CLAUDE.md", parser = "claude" },
                    },
                    is_preset = true,
                },
                opts = {},
            },
            opts = {
                chat = {
                    autoload = "default",
                    enabled = true,
                },
                log_level = "DEBUG",
                language = "Portuguese",
            },
        })

        vim.keymap.set(
            "n",
            "<leader>cca",
            "<Cmd>CodeCompanionActions<CR>",
            { desc = "Open [C]ode[C]ompanion [A]ctions" }
        )
        vim.keymap.set(
            "n",
            "<leader>cct",
            "<Cmd>CodeCompanionChat Toggle<CR>",
            { desc = "[C]ode[C]ompanion [T]oggle chat" }
        )
        vim.keymap.set(
            "x",
            "<leader>cct",
            ":'<,'>CodeCompanionChat Toggle<CR>",
            { desc = "[C]ode[C]ompanion [T]oggle chat" }
        )
    end,
}
