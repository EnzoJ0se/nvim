-- return {
--     'github/copilot.vim',
--     config = function()
--         vim.api.nvim_set_keymap("i", "<C-b>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--         vim.g.copilot_no_tab_map = true
--     end
-- };

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = false,
            },
            suggestion = {
                enabled = false,
                auto_trigger = false,
                hide_during_completion = true,
                debounce = 75,
                trigger_on_accept = true,
                keymap = {
                    accept = "<C-b>",
                    accept_word = false,
                    accept_line = false,
                },
            },
        })
    end,
}
