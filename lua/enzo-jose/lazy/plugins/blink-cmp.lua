return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        "folke/lazydev.nvim",
        {
            "giuxtaposition/blink-cmp-copilot",
            after = { "copilot.lua" },
        },
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = (function()
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
            opts = {},
        },
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
        sources = {
            default = { "lsp", "path", "snippets", "lazydev", "copilot" },
            per_filetype = {
                sql = { "snippets", "dadbod", "buffer" },
                mysql = { "snippets", "dadbod", "buffer" },
                plsql = { "snippets", "dadbod", "buffer" },
            },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
        signature = { enabled = true },
        appearance = {
            nerd_font_variant = "mono",
            -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
            kind_icons = {
                Copilot = "",
                Text = "󰉿",
                Method = "󰊕",
                Function = "󰊕",
                Constructor = "󰒓",

                Field = "󰜢",
                Variable = "󰆦",
                Property = "󰖷",

                Class = "󱡠",
                Interface = "󱡠",
                Struct = "󱡠",
                Module = "󰅩",

                Unit = "󰪚",
                Value = "󰦨",
                Enum = "󰦨",
                EnumMember = "󰦨",

                Keyword = "󰻾",
                Constant = "󰏿",

                Snippet = "󱄽",
                Color = "󰏘",
                File = "󰈔",
                Reference = "󰬲",
                Folder = "󰉋",
                Event = "󱐋",
                Operator = "󰪚",
                TypeParameter = "󰬛",
            },
        },
    },
}
