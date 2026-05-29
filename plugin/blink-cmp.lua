local function gh(repo)
    return "https://github.com/" .. repo
end

do
    vim.pack.add({ { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2.*") } })
    require("luasnip").setup({})

    vim.pack.add({ { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") } })
    require("blink.cmp").setup({
        keymap = {
            preset = "default",
            ["<Tab>"] = {},
            ["<S-Tab>"] = {},
            ["<C-H>"] = {
                function(cmp)
                    cmp.snippet_backward()
                end,
            },
            ["<C-L>"] = {
                function(cmp)
                    cmp.snippet_forward()
                end,
            },
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
        sources = {
            default = { "lsp", "path", "snippets" },
            per_filetype = {
                sql = { "dadbod", "buffer" },
                mysql = { "snippets", "dadbod", "buffer" },
                plsql = { "snippets", "dadbod", "buffer" },
                codecompanion = { "codecompanion" },
            },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
        },
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
        signature = { enabled = true },
        appearance = {
            nerd_font_variant = "mono",
        },
    })
end
