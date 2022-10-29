local colors = {
    blue    = '#83a598',
    cyan    = '#8ec07c',
    red     = '#fb4934',
    violet  = '#d3869b',
    white   = '#ebdbb2',
    l_grey  = '#a89984',
    d_grey  = '#504945',
    black   = '#282828',
    green   = '#a8bbc6',
}

local gruvbox = {
    normal = {
        a = { fg = colors.black,  bg = colors.green,   gui='bold' },
        b = { fg = colors.white,  bg = colors.d_grey             },
        c = { fg = colors.l_grey, bg = colors.black              },
    },
    insert  = { a = { fg = colors.black, bg = colors.blue,   gui='bold' } },
    visual  = { a = { fg = colors.black, bg = colors.red,    gui='bold' } },
    replace = { a = { fg = colors.black, bg = colors.cyan,   gui='bold' } },
    command = { a = { fg = colors.black, bg = colors.violet, gui='bold' } },
    inactive = {
        a = { fg = colors.l_grey, bg = colors.d_grey },
        b = { fg = colors.green, bg = colors.d_grey },
        c = { fg = colors.green, bg = colors.d_grey },
        x = { fg = colors.l_grey, bg = colors.d_grey, gui='italic' },
    },
}

vim.g.gitblame_display_virtual_text = 0

local navic = require("nvim-navic")

-- Main

require('lualine').setup({
    options = {
        refresh = {
            statusline = 50,
            tabline    = 50,
            winbar     = 50
        },
        icons_enabled        = true,
        theme                = gruvbox,
        section_separators   = '',
        component_separators = '',
        disabled_filetypes   = {},
        always_divide_middle = true,
        globalstatus         = false,
    },
    sections = {
        lualine_a = { { 'mode', separator = { right = '' } } },
        lualine_b = {
        {
            'diagnostics',
            symbols = {
                error = 'E ',
                warn  = 'W ',
                info  = 'I ',
                hint  = 'H ',
            },
            diagnostics_color = {
                error = { fg = '#fb4934',  gui='bold' },
                warn  = { fg = '#fabd2f',  gui='bold' },
                info  = { fg = '#83a598',  gui='bold' },
                hint  = { fg = '#8ec07c',  gui='bold' },
            },
            separator = { right = "" }
        },
        'diff',
        {'branch', icon = '', separator =  { right = '' } },
        },
        lualine_c = {
            'filesize',
            { "filename", symbols = { modified = ' ', readonly = ' ', unnamed = '[No Name]', path = 3 } },
            { navic.get_location, cond = navic.is_available },
        },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { { 'filetype', colored = false, separator = { left = ' ' } } },
        lualine_z = { { 'progress', separator = { left = '' } }, 'location' }
    },
    inactive_sections = {
        lualine_a = { { 'filename', symbols = { modified = ' ', readonly = ' ', unnamed  = '[No Name]', path = 3 } } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        'neo-tree',
        'toggleterm',
    }
})
