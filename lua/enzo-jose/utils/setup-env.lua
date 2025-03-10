local SetupEnv = {}

local function load_env_file()
    local env_file = vim.fn.expand("~/.config/nvim/.env")
    local file = io.open(env_file, "r")

    if file then
        for line in file:lines() do
            local key, value = line:match("([^=]+)=(.+)")
            if key and value then
                vim.fn.setenv(key, value)
            end
        end

        file:close()
    end
end

function SetupEnv:setup(opts)
    load_env_file()
end

return SetupEnv
