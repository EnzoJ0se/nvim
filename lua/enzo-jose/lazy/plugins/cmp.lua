return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
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
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = {
				-- Scroll the documentation window [b]ack / [f]orward
				-- ["<C-[>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-]>"] = cmp.mapping.scroll_docs(4),

				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- DISABLED ENTER TO TEST
				-- ["<CR>"] = cmp.mapping(
				--     cmp.mapping.confirm {
				--         behavior = cmp.ConfirmBehavior.Insert,
				--         select = true,
				--     },
				--     { "i", "c" }
				-- ),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "lazydev", group_index = 0 },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
		})

		luasnip.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
		})

		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/enzo-jose/custom/snippets/*.lua", true)) do
			loadfile(ft_path)()
		end
	end,
}
