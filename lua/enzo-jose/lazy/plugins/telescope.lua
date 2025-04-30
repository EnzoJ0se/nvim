local ignorePaths = {
    "--glob=!**/.git/*",
    "--glob=!**/.idea/*",
    "--glob=!**/.angular/*",
    "--glob=!**/.vscode/*",
    "--glob=!**/build/*",
    "--glob=!**/dist/*",
    "--glob=!**/yarn.lock",
    "--glob=!**/package-lock.json",
    "--glob=!**/vendor/*",
    "--glob=!**/analyseCache/*",
    "--glob=!**/.github/*",
    "--glob=!**.cache",
    "--glob=!**/node_modules/*",
    "--glob=!**/public/*",
    "--glob=!**/storage/api-docs",
    "--glob=!**/storage/app",
    "--glob=!**/storage/framework",
    "--glob=!**/storage/docs",
}

return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    prompt_position = "top",
                    preview_width = 0.5,
                },
                sorting_strategy = "ascending",
                path_display = {
                    -- "smart"
                    -- "shorten"
                    "truncate",
                },
                vimgrep_arguments = {
                    "rg",
                    "--follow", -- Follow symbolic links
                    "--hidden", -- Search for hidden files
                    "--no-heading", -- Don't group matches by each file
                    "--with-filename", -- Print the file path with the matched lines
                    "--line-number", -- Show line numbers
                    "--column", -- Show column numbers
                    "--smart-case", -- Smart case search
                    "--no-ignore",
                    unpack(ignorePaths),
                },
                extensions = {
                    ["ui-select"] = { dropdown },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--no-ignore",
                        unpack(ignorePaths),
                    },
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "fzf")
        local builtin = require("telescope.builtin")

        vim.keymap.set(
            "n",
            "<leader>/",
            builtin.current_buffer_fuzzy_find,
            { desc = "[/] Fuzzily search in current buffer" }
        )
        vim.keymap.set("n", "<C-P>", builtin.git_files, { desc = "Search [G]it [F]iles" })
        vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
        vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]ick [F]iles" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]resume" })
    end,
}
