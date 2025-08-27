local state = {
    buf = -1,
    win = -1,
}

local function openFloatingWindow(opts, cmd)
    cmd = cmd or nil

    local buf = nil

    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    local width = math.floor(vim.o.columns * 0.85)
    local height = math.floor(vim.o.lines * 0.85)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = opts.relative ~= nil and opts.relative or "editor",
        width = opts.width ~= nil and opts.width or width,
        height = opts.height ~= nil and opts.height or height,
        row = opts.row ~= nil and opts.row or row,
        col = opts.col ~= nil and opts.col or col,
        style = "minimal",
        border = "rounded",
    })

    if cmd and #cmd > 0 then
        vim.fn.termopen(cmd, {
            on_exit = function()
                vim.api.nvim_win_close(win, true)
                vim.api.nvim_buf_delete(buf, { force = true })
            end,
        })
    else
        vim.cmd.terminal()
    end

    return { buf = buf, win = win }
end

local toggleTerminal = function(cmd, opts)
    if not vim.api.nvim_win_is_valid(state.win) then
        opts.buf = state.buf
        state = openFloatingWindow(opts, cmd)
    else
        vim.api.nvim_win_hide(state.win)
    end

    vim.api.nvim_command("startinsert")
end

vim.api.nvim_create_user_command("ToggleTerm", function(opts)
    toggleTerminal(opts.args, {})
end, { nargs = "*" })

vim.api.nvim_create_user_command("ToggleTermMedium", function(opts)
    local width = math.floor(vim.o.columns * 0.65)
    local height = math.floor(vim.o.lines * 0.5)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    toggleTerminal(opts.args, { width = width, height = height, row = row, col = col })
end, { nargs = "*" })
