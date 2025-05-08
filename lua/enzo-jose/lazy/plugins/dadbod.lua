return {
    "tpope/vim-dadbod",
    dependencies = {
        {"kristijanhusak/vim-dadbod-completion",  ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        "kristijanhusak/vim-dadbod-ui",
    },
    config = function()
        vim.g.db_ui_use_nerd_fonts = 1;
        vim.g.dbs = {
            { name = 'eloverde_env_dev',  url = "mysql://enzo:" .. vim.fn.getenv("MY_SQL_DB_PASSWORD") .. "@localhost:3306/eloverde_env_dev" },
            { name = 'eloverde_env_prod', url = "mysql://enzo:" .. vim.fn.getenv("MY_SQL_DB_PASSWORD") .. "@localhost:3306/eloverde_env_prod" },
        }

        local view = require('enzo-jose.utils.view-helper');

        vim.keymap.set("n", "<leader>db", "<Cmd>:DBUIToggle<CR>", { desc = "Open [DB] UI" });
        vim.keymap.set('n', '<leader>dB', function() view:openFloatingWindow({ commands = "zsh -i -c 'nvim +DBUIToggle'" }) end, {
            desc = "Open [DB] UI",
            noremap = true,
            silent = true,
        });
    end
}
