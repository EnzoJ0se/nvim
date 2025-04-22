return {
    'github/copilot.vim',
    config = function()
        vim.api.nvim_set_keymap("i", "<C-b>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.g.copilot_no_tab_map = true
	vim.g.copilot_enabled = 0
    end
};
