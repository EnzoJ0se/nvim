local function gh(repo)
    return "https://github.com/" .. repo
end

do
    vim.pack.add({ gh("numToStr/Comment.nvim") })

    require("Comment").setup({
        toggler = {
            line = "<C-_>",
            block = "<C-_>",
        },
    })
end
