do
    vim.pack.add({ gh("numToStr/Comment.nvim") })

    require("Comment").setup({
        toggler = {
            line = "<C-_>",
            block = "<C-_>",
        },
    })
end
