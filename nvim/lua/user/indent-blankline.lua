require("indent_blankline").setup {
    show_current_context       = true,
    show_current_context_start = false,
    indent_blankline_use_treesitter = true,
}

vim.cmd[[highlight! link IndentBlanklineContextChar GruvboxBg4]]
