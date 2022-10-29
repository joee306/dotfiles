local actions = require "telescope.actions"

require('telescope').setup {
    defaults = {
        prompt_prefix   = "   ",
        selection_caret = " ",
        path_display    = { "smart" },
        mappings        = {
            i = {
                ["<C-n>"]      = actions.cycle_history_next,
                ["<C-p>"]      = actions.cycle_history_prev,

                ["<C-c>"]      = actions.close,
                ["<CR>"]       = actions.select_default,

                ["<PageUp>"]   = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
            },
            n = {
                ["<esc>"]      = actions.close,
                ["<CR>"]       = actions.select_default,

                ["j"]          = actions.move_selection_next,
                ["k"]          = actions.move_selection_previous,

                ["gg"]         = actions.move_to_top,
                ["G"]          = actions.move_to_bottom,

                ["<PageUp>"]   = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
    },
    extensions = {},
    pickers = {
        find_files = {
            find_command = { "fd", "-HI", "--regex", "--type", "f" }
        },
    },
}

vim.cmd[[
    highlight! link TelescopeNormal        GruvboxYellow
    highlight! link TelescopePromptCounter GruvboxRed
    highlight! link TelescopePromptBorder  TelescopePromptCounter
    highlight! link TelescopePromptTitle   GruvboxRedBold
    highlight! link TelescopeResultsNormal Normal
    highlight! link TelescopePromptNormal  TelescopeResultsNormal
    highlight! link TelescopePreviewNormal TelescopeResultsNormal
    highlight! link TelescopeMatching      GruvboxRed
    highlight! link TelescopeSelection     TelescopeNormal
    highlight! link PreviewLink            GruvboxBlue
    highlight TelescopePreviewLine  guifg=NONE guibg=#504945
    highlight TelescopePreviewMatch guifg=NONE guibg=#504945
]]
