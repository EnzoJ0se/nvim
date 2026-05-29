local function gh(repo)
    return "https://github.com/" .. repo
end

do
    vim.pack.add({ gh"mbbill/undotree" })
    vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
end
