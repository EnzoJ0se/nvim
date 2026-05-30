do
    vim.pack.add({ gh("folke/tokyonight.nvim") })
    require("tokyonight").setup({
        styles = { comments = { italic = false } },
    })

    -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
    vim.cmd.colorscheme("tokyonight-night")
end
-- do
--     vim.pack.add({ gh("kaicataldo/material.vim") })
--     -- 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
--     -- 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
--     vim.g.material_theme_style = "darker"
--     vim.cmd.colorscheme("material")
-- end
--
-- do
--     vim.pack.add({ gh("catppuccin/nvim") })
--     -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
--     vim.cmd.colorscheme("catppuccin-macchiato")
-- end
--
-- do
--     vim.pack.add({ gh("dracula/vim") })
--     vim.cmd.colorscheme("dracula")
-- end
--
-- do
--     vim.pack.add({ gh("folke/tokyonight.nvim") })
--     -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
--     vim.cmd.colorscheme("tokyonight-night")
-- end
--
-- do
--     vim.pack.add({ gh("navarasu/onedark.nvim") })
--     vim.cmd.colorscheme("onedark")
-- end
--
-- do
--     vim.pack.add({ gh("oxfist/night-owl.nvim") })
--     -- load the colorscheme here
--     vim.cmd.colorscheme("night-owl")
-- end
--
-- do
--     vim.pack.add({ gh("AlexvZyl/nordic.nvim") })
--     vim.cmd.colorscheme("nordic")
-- end
