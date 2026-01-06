return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
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
            "blade",

            "git_config",
            "gitcommit",
            "git_rebase",
            "gitignore",
            "gitattributes",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function(_, opts)
        require("treesitter-context").setup({ max_lines = 2, multiline_threshold = 1 })
        require("nvim-treesitter.configs").setup(opts)

        vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })

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
