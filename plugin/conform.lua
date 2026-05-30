do
    -- [[ Formatting ]]
    vim.pack.add({
        gh("stevearc/conform.nvim"),
        gh 'nmac427/guess-indent.nvim',
    })

    require('guess-indent').setup {}
    require("conform").setup({
        notify_on_error = false,
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "php-cs-fixer" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = { },
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
    end, { desc = "[F]ormat buffer" })
end
