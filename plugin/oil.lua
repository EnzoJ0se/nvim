do
    vim.pack.add({ gh("stevearc/oil.nvim"), gh("nvim-tree/nvim-web-devicons") })

    require("oil").setup({
        default_file_explorer = false,
        view_options = {
            show_hidden = true,
        },
    })

    -- OPEN OIL ON CURRENT FILE DIRECTORY
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Execute [E]xplore command (OIL)" })
end
