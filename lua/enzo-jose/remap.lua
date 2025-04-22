-- DEFAULT
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NAVIGATION
--------------------------------------
--
-- MOVE LINES
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- QUICKFIX LIST
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Go to [N]ext quickfix item",
})
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>", {
	noremap = true,
	silent = true,
	desc = "Go to [P]previous quickfix item",
})
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", {
	noremap = true,
	silent = true,
	desc = "[C]lose quickfix list",
})

-- ON NAVIGATE HALF PAGE KEEP CURSOR CENTERED
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-b>", "<C-u>zz")

-- ON SEARCH KEEP CURSOR CENTERED
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- PASTE WHITOUT LOOSE BUFFER
vim.keymap.set("x", "<leader>p", [["_dP]])

--  SAVE ALL FILES
vim.keymap.set("n", "<leader>w", "<Cmd>:wa<CR>")
vim.keymap.set("n", "<C-s>", "<Cmd>:wa<CR>")

-- CLOSE TAG
vim.keymap.set("n", "<leader>Ct", "<Cmd>:tabclose<CR>", { desc = "[T]ab [C]lose" })

-- REMOVE KEYMAPS
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-u>", "<nop>")

-- QUIT INSERT AND VISUAL MODE
vim.keymap.set({ "i", "v" }, "<C-c>", "<ESC>")
vim.keymap.set({ "i" }, "jj", "<ESC>")

-- OPEN NETRW ON CURRENT FILE DIRECTORY
vim.keymap.set("n", "<leader>-", "<CMD>:Explore<CR>", { desc = "Execute [E]xplore command (NETRW)" })

-- RESIZE WINDOWS
vim.keymap.set("n", "<M-<>", "<c-w>5<")
vim.keymap.set("n", "<M->>", "<c-w>5>")
vim.keymap.set("n", "<M-9>", "<C-W>+")
vim.keymap.set("n", "<M-0>", "<C-W>-")

--------------------------------------
-- TMUX windownizer and sessionizer
local runCMD = function(cmd)
	local width = math.floor(vim.o.columns * 0.65)
	local height = math.floor(vim.o.lines * 0.5)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	require("enzo-jose.utils.view-helper"):openFloatingWindow({
		commands = "zsh -i -c '" .. cmd .. " && exit'",
		width = width,
		height = height,
		row = row,
		col = col,
	})
end

vim.keymap.set("n", "<leader>ow", function()
	runCMD("tmux-windownizer")
end, {
	noremap = true,
	silent = true,
	desc = "Open [O]pen TMUX [W]indowizer",
})
vim.keymap.set("n", "<leader>os", function()
	runCMD("tmux-sessionizer")
end, {
	noremap = true,
	silent = true,
	desc = "Open [O]pen TMUX [S]essionizer",
})
