require'hop'.setup {
    case_insensitive  = false,
    create_hl_autocmd = true,
}

vim.cmd[[
    hi HopNextKey   guifg=#fb4934 gui=bold
    hi HopNextKey1  guifg=#fe8019 gui=bold
    hi HopNextKey2  guifg=#fabd2f gui=bold
    hi HopUnmatched guifg=#7c6f64
]] -- Highlights
