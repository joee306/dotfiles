local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

local logo = {
    [[                                                   $$\               ]],
    [[                                                   \__|              ]],
    [[ $$$$$$\  $$$$$$$\ $$\    $$\ $$\   $$\ $$\    $$\ $$\ $$$$$$\$$$$\  ]],
    [[$$  __$$\ $$  __$$\\$$\  $$  |$$ |  $$ |\$$\  $$  |$$ |$$  _$$  _$$\ ]],
    [[$$$$$$$$ |$$ |  $$ |\$$\$$  / $$ |  $$ | \$$\$$  / $$ |$$ / $$ / $$ |]],
    [[$$   ____|$$ |  $$ | \$$$  /  $$ |  $$ |  \$$$  /  $$ |$$ | $$ | $$ |]],
    [[\$$$$$$$\ $$ |  $$ |  \$  /   \$$$$$$$ |   \$  /   $$ |$$ | $$ | $$ |]],
    [[ \_______|\__|  \__|   \_/     \____$$ |    \_/    \__|\__| \__| \__|]],
    [[                              $$\   $$ |                             ]],
    [[                              \$$$$$$  |                             ]],
    [[                               \______/                              ]]
}

local section_header = {
    type = "text",
    val  = logo,
    opts = {
        shrink_margin = false,
        position = "center",
    }
}

local buttons = {
    type = "group",
    val = {
        { type = "padding", val = 2 },
        dashboard.button("e", "  New file",              "<cmd>ene <BAR> startinsert <CR>"),
        dashboard.button("o", "ﭯ  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("f", "  Find file",             "<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>"),
        dashboard.button("g", "  Find word",             "<cmd>Telescope live_grep find_command=rg<CR>"),
        dashboard.button("m", "  Show mark",             "<cmd>Telescope marks<CR>"),
        dashboard.button("s", "  NV-IDE plugins",        "<cmd>e ~/.config/nvim/lua/user/plugins.lua<CR>"),
        dashboard.button("p", "  Sync plugins",          "<cmd>PackerSync<CR>"),
        dashboard.button("h", "  Neovim Check health",   "<cmd>checkhealth<CR>"),
        dashboard.button("q", "  Quit",                  "<cmd>qa<CR>"),
        dashboard.button("l", "  LSP Info",              "<cmd>LspInstallInfo<CR>"),
    },
  position = "center",
}

local opts = {
    layout = {
        { type = "padding", val = 7 }, section_header,
        { type = "padding", val = 2 }, buttons,
    },
}

alpha.setup(opts)
