local function gh(repo)
    return "https://github.com/" .. repo
end
do
    -- [[ Formatting ]]
    vim.pack.add({ gh("stevearc/conform.nvim") })
    require("conform").setup({
        notify_on_error = false,
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "php-cs-fixer" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
        },
        default_format_opts = {
            lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
        },
        -- You can also specify external formatters in here.
        formatters_by_ft = {
            -- rust = { 'rustfmt' },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use 'stop_after_first' to run the first available formatter from the list
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
    end, { desc = "[F]ormat buffer" })
end
