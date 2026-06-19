do
    vim.pack.add({
        gh("MeanderingProgrammer/render-markdown.nvim"),
    })

    require("render-markdown").setup({})
    vim.cmd("RenderMarkdown disable")

    vim.keymap.set("n", "<leader>rm", "<cmd>RenderMarkdown toggle<cr>", { desc = "[R]ender [M]arkdown toggle" })
end
