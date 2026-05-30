do
    vim.pack.add({ gh"mbbill/undotree" })
    vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
end
