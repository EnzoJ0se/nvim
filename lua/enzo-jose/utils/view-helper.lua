local ViewHelper = {}

-- @class ViewSettings
-- @field title string
-- @field width number
-- @field row number
-- @field col number
-- @field height number
-- @field commands string
local ViewSettings = {};

-- @param opts ViewSettings
function ViewHelper:openFloatingWindow(opts)
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * 0.85)
    local height = math.floor(vim.o.lines * 0.85)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = opts.relative ~= nil and opts.relative or 'editor',
        width = opts.width ~= nil and opts.width or width,
        height = opts.height ~= nil and opts.height or height,
        row = opts.row ~= nil and opts.row or row,
        col = opts.col ~= nil and opts.col or col,
        style = 'minimal',
        border = 'rounded'
    })

    local term_id = vim.fn.termopen(opts.commands, {
        on_exit = function()
            vim.api.nvim_win_close(win, true)
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    })

    vim.api.nvim_command("startinsert");
end

return ViewHelper;
