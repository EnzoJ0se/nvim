return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "tsx",
            "javascript",
            "typescript",
            "php",
            "bash",
            "dot",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
    dependencies = {
        "EmranMR/tree-sitter-blade",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function(_, opts)
        require("treesitter-context").setup({ max_lines = 2, multiline_threshold = 1 })
        require("nvim-treesitter.configs").setup(opts)
        vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        --------------------------------------
        -- Diagnostic keymaps
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
        vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

        -- TREESITTER CONTEXT
        vim.keymap.set("n", "<leader>ct", function()
            require("treesitter-context").go_to_context()
        end, { silent = true })
    end,
}
