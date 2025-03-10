return {
    "tpope/vim-dadbod",
    dependencies = {
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui",
    },
    config = function()
        require('cmp').setup.filetype({ "sql", "mysql", "plsql", }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })

        vim.g.db_ui_use_nerd_fonts = 1;
        vim.g.dbs = {
            { name = 'eloverde_env_dev',  url = "mysql://enzo:" .. vim.fn.getenv("MY_SQL_DB_PASSWORD") .. "@localhost:3306/eloverde_env_dev" },
            { name = 'eloverde_env_prod', url = "mysql://enzo:" .. vim.fn.getenv("MY_SQL_DB_PASSWORD") .. "@localhost:3306/eloverde_env_prod" },
        }

        vim.keymap.set("n", "<leader>dB", "<Cmd>:tabnew+DBUIToggle<CR>", { desc = "Open [DB] UI" });
        vim.keymap.set("n", "<leader>db", "<Cmd>:DBUIToggle<CR>", { desc = "Open [DB] UI" });
    end
}
