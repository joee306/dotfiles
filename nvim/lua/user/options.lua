local lua_options = {
    mouse          = "a",     -- Allow mouse control
    expandtab      = true,    -- Change tabs to spaces
    shiftwidth     = 4,       -- Change the indentation width to 2
    tabstop        = 4,       -- Change the tab width to 2
    number         = true,    -- Show line numbers
    numberwidth    = 2,       -- Set width of line numbers to 2
    fileencoding   = "utf-8", -- Set the file encoding format
    hlsearch       = false,   -- Highlight search matches
    scrolloff      = 6,       -- Start scrolling vertically at 6 pixels from the end
    sidescrolloff  = 6,       -- Start scrolling horizontally at 6 pixels from the end
    backup         = false,   -- Don't backup files
    smartindent    = true,    -- Enable smart indent
    termguicolors  = true,    -- Allow terminals to use more colors
    signcolumn     = "yes",   -- Add a column on the left
    ignorecase     = true,    -- Disable case sensitivity
    smartcase      = true,    -- Enable smartcase
    showmode       = false,   -- Disable showmode
    showcmd        = false,   -- Disable cmd
    foldcolumn     = '1',     -- When and how to draw the foldcolumn
    foldlevel      = 99,      -- Sets the foldlevel
    foldlevelstart = 99,      -- Sets 'foldlevel' when starting to edit another buffer in a window.
    foldenable     = true,    -- Enables folding
    cursorline     = false,   -- Add cursorline
    wrap           = false,   -- Disable wrap by defatult
}

for key, value in pairs(lua_options) do
    vim.opt[key] = value
end

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]] -- For UFO

-- Automatically remove whitespace during filesave
vim.cmd[[autocmd BufWritePre * %s/\s\+$//e]]

-- Set cmp menu transparency
vim.cmd[[
    hi PmenuSel guibg=#8ec07c guifg=#282828
]]

-- Show tabs, trailing whitespace and spaces
vim.cmd[[
    set listchars+=space:·,trail:×,tab:<·>
    set list
    hi NonText guifg=#504945
]]

-- Enable cursor blinking in insert mode
vim.cmd[[ set guicursor+=a:blinkon1 ]]
