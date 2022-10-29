require("gruvbox").setup({
    undercurl            = true,
    underline            = true,
    bold                 = true,
    italic               = false,
    strikethrough        = true,
    invert_selection     = false,
    invert_signs         = false,
    invert_tabline       = false,
    invert_intend_guides = false,
    inverse              = false, -- invert background for search, diffs, statuslines and errors
    contrast             = "", -- can be "hard", "soft" or empty string
    overrides            = {},
    dim_inactive         = false,
    transparent_mode     = true,
})

local colorscheme  = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("Error: Colorscheme " .. colorscheme .. " not found.")
    return
end

vim.cmd[[
    hi  Visual       guifg=#ebdbb2 guibg=#cc241d gui=NONE
    hi  Search       guifg=#4d5f47 guibg=#8ec07c
    hi  SignColumn   guifg=NONE    guibg=NONE    gui=NONE

    set cursorline
    hi  CursorLineNr gui=bold      guifg=#ebdbb2
    hi  CursorColumn guibg=#32302f

    hi  ErrorMsg     guibg=none    guifg=#fb4934 gui=bold
    hi  MsgArea      guifg=#ebdbb2

    hi  Identifier   guifg=#83a598
    hi  PreProc      guifg=#d38598
    hi  Type         guifg=#b8bb26

    hi  FloatBorder  guifg=#7c6f64
]]
