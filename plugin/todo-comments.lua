local function gh(repo)
    return "https://github.com/" .. repo
end

do
    vim.pack.add({ gh("folke/todo-comments.nvim") })
    require("todo-comments").setup({ signs = false })
end
