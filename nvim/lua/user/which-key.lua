require("which-key").setup {
    icons = {
        breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
        separator  = "->", -- symbol used between a key and it's label
        group      = "+", -- symbol prepended to a group
    },
    triggers = {
        "<leader>",
        "<c-w>",
        "\"",
        "!",
        "'",
        "@",
        "[",
        "]",
        "`",
        "z",
    },
    window = {
        border   = "rounded",
        position = "bottom",
        winblend = 0,
        margin =  { 0, 0, 0, 0 }, -- [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- [top, right, bottom, left]
    },
    spelling = {
        enabled     = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20,   -- how many suggestions should be shown in the list?
    },
    popup_mappings = {
        scroll_down = '<C-j>', -- binding to scroll down inside the popup
        scroll_up   = '<C-k>', -- binding to scroll up inside the popup
    },
}

vim.cmd[[highlight! link WhichKeyValue     Normal]]
vim.cmd[[highlight! link WhichKeySeparator GruvboxYellow]]
