local function buildDBS()
    local dbs = {}
    local user = vim.fn.getenv("MY_SQL_DB_USER")
    local pass = vim.fn.getenv("MY_SQL_DB_PASSWORD_ENCODED")
    local cmd = "get-db-schemas " .. user .. ' "' .. vim.fn.getenv("MY_SQL_DB_PASSWORD") .. '"'
    local output = vim.fn.systemlist(cmd)

    for i = 2, #output do
        local schema = output[i]
        table.insert(dbs, { name = schema, url = string.format("mysql://%s:%s@localhost:3306/%s", user, pass, schema) })
    end

    return dbs
end

return {
    "tpope/vim-dadbod",
    dependencies = {
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        "kristijanhusak/vim-dadbod-ui",
    },
    config = function()
        local view = require("enzo-jose.utils.view-helper")

        vim.g.dbs = buildDBS()
        vim.g.db_ui_win_position = "left"
        vim.g.db_ui_use_nerd_fonts = 1
        vim.keymap.set("n", "<leader>db", "<Cmd>:DBUIToggle<CR>", { desc = "Open [DB] UI" })
        vim.keymap.set("n", "<leader>dB", "<Cmd>:tabnew+DBUIToggle<CR>", {
            desc = "Open [DB] UI",
            noremap = true,
            silent = true,
        })
    end,
}
