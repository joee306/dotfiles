vim.g.code_action_menu_window_border = "rounded"

vim.cmd[[
    highlight! link DiffAdd     GruvboxGreen
    highlight! link DiffDelete  GruvboxRed
    highlight! link DiffChange  GruvboxAqua
    hi CodeActionMenuWarningMessageText guifg=#7c6f64 gui=bold
]]
