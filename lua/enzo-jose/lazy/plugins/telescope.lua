return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local dropdown = require("telescope.themes").get_dropdown({
			layout_config = {
				width = 0.5,
				height = 0.5,
			},
		})

		require("telescope").setup({
			defaults = {
				path_display = {
					-- "smart"
					-- "shorten"
					"truncate",
				},
				vimgrep_arguments = {
					"rg",
					"--follow", -- Follow symbolic links
					"--hidden", -- Search for hidden files
					"--no-heading", -- Don't group matches by each file
					"--with-filename", -- Print the file path with the matched lines
					"--line-number", -- Show line numbers
					"--column", -- Show column numbers
					"--smart-case", -- Smart case search
					"--no-ignore",

					-- Exclude some patterns from search
					"--glob=!**/.git/*",
					"--glob=!**/.idea/*",
					"--glob=!**/.angular/*",
					"--glob=!**/.vscode/*",
					"--glob=!**/build/*",
					"--glob=!**/dist/*",
					"--glob=!**/yarn.lock",
					"--glob=!**/package-lock.json",
					"--glob=!**/vendor/*",
					"--glob=!**/analyseCache/*",
					"--glob=!**/.github/*",
					"--glob=!**.cache",
					"--glob=!**/node_modules/*",
					"--glob=!**/public/*",
					"--glob=!**/storage/api-docs",
					"--glob=!**/storage/app",
					"--glob=!**/storage/framework",
					"--glob=!**/storage/docs",
				},
				extensions = {
					["ui-select"] = { dropdown },
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore",

						"--glob=!**/.git/*",
						"--glob=!**/.idea/*",
						"--glob=!**/.vscode/*",
						"--glob=!**/build/*",
						"--glob=!**/dist/*",
						"--glob=!**/yarn.lock",
						"--glob=!**/package-lock.json",
						"--glob=!**/.angular/*",
						"--glob=!**/node_modules/*",
						"--glob=!**/analyseCache/*",
						"--glob=!**/.github/*",
						"--glob=!**.cache",
						"--glob=!**/vendor/*",
						"--glob=!**/public/*",
						"--glob=!**/storage/api-docs",
						"--glob=!**/storage/app",
						"--glob=!**/storage/framework",
						"--glob=!**/storage/docs",
					},
				},
			},
			extensions = { ["ui-select"] = { dropdown } },
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "fzf")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>/", function() builtin.current_buffer_fuzzy_find(dropdown) end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<C-P>", function() builtin.git_files(dropdown) end, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>?", function() builtin.oldfiles(dropdown) end, { desc = "[?] Find recently opened files" })
		vim.keymap.set("n", "<leader><space>", function() builtin.buffers(dropdown) end, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>pf", function() builtin.find_files(dropdown) end, { desc = "[P]ick [F]iles" })
		vim.keymap.set("n", "<leader>sh", function() builtin.help_tags(dropdown) end, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sw", function() builtin.grep_string(dropdown) end, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", function() builtin.live_grep(dropdown) end, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", function() builtin.diagnostics(dropdown) end, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", function() builtin.resume(dropdown) end, { desc = "[S]earch [R]resume" })
	end,
}
