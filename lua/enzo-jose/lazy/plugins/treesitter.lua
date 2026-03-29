return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        local parsers = {
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
            "blade",
            "dot",
            "git_config",
            "gitcommit",
            "git_rebase",
            "gitignore",
            "gitattributes",
        }
        require("nvim-treesitter").install(parsers)
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local buf, filetype = args.buf, args.match
                local language = vim.treesitter.language.get_lang(filetype)
                if not language then
                    return
                end

                -- check if parser exists and load it
                if not vim.treesitter.language.add(language) then
                    return
                end
                -- enables syntax highlighting and other treesitter features
                vim.treesitter.start(buf, language)

                -- enables treesitter based folds
                -- for more info on folds see `:help folds`
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'

                -- enables treesitter based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
        require("treesitter-context").setup({ max_lines = 2, multiline_threshold = 1 })

        --------------------------------------
        -- Diagnostic keymaps
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
        vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

        -- TREESITTER CONTEXT
        vim.keymap.set("n", "<leader>ct", function() require("treesitter-context").go_to_context() end, { silent = true })
    end,
}
