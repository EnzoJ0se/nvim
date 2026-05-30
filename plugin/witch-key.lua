do
    vim.pack.add({ gh("folke/which-key.nvim") })

    require("which-key").setup({
        delay = 0,
        icons = { mappings = vim.g.have_nerd_font },
        spec = {
            { "<leader>Ws", group = "[S]earch", mode = { "n", "v" } },
            { "<leader>Wt", group = "[T]oggle" },
            { "<leader>Wh", group = "Git [H]unk", mode = { "n", "v" } }, -- Enable gitsigns recommended keymaps first
            --[[ { "gr", group = "LSP Actions", mode = { "n" } }, ]]
        },
    })
end
