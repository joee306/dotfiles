local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

require("bufferline").setup({
    options = {
        numbers                      = "none",
        close_command                = "Bdelete! %d",
        right_mouse_command          = "Bdelete! %d",
        left_mouse_command           = "buffer %d",
        middle_mouse_command         = nil,
        buffer_close_icon            = "",
        modified_icon                = "",
        left_trunc_marker            = "<--",
        right_trunc_marker           = "-->",
        indicator                    = { icon = " ", style = "icon" },
        max_name_length              = 19,
        max_prefix_length            = 30, -- prefix used when a buffer is de-duplicated
        tab_size                     = 20,
        diagnostics                  = false, -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        show_buffer_icons            = false,
        show_buffer_close_icons      = true,
        show_close_icon              = false,
        show_tab_indicators          = true,
        separator_style              = "thin",
        persist_buffer_sort          = true,
        enforce_regular_tabs         = true,
        always_show_bufferline       = true,
        offsets                      = {{
            filetype  = "neo-tree",
            text      = "File Explorer",
            padding   = -14,
            highlight = "GruvboxYellowBold",
            text_align = "left"
        }},
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "車" })
            }
        }
    },
    highlights = {
        fill = {
          fg = "#fabd2f",
          bg = "none",
          bold = true,
        },
        background = {
          fg = "#928374",
          bg = "#504945",
          italic = true,
        },

        buffer_selected = {
          fg = "#ebdbb2",
          bg = "#665c54",
          italic = true,
        },
        buffer_visible = {
          fg = "#928374",
          bg = "#504945",
          italic = true,
        },

        close_button_selected = {
          fg = "#ebdbb2",
          bg = "#665c54",
        },
        close_button = {
          fg = "#928374",
          bg = "#504945",
        },
        close_button_visible = {
          fg = "#928374",
          bg = "#504945",
        },

        tab_selected = {
          fg = "#ebdbb2",
          bg = "none",
        },
        tab = {
          fg = "#928374",
          bg = "#504945",
        },
        tab_close = {
          fg = "#ebdbb2",
          bg = "none",
        },

        duplicate_selected = {
          fg = "#b8bb26",
          bg = "#504945",
        },
        duplicate_visible = {
          fg = "#928374",
          bg = "#504945",
        },
        duplicate = {
          fg = "#928374",
          bg = "#504945",
        },

        modified = {
          fg = "#928374",
          bg = "#504945",
        },
        modified_selected = {
          fg = "#ebdbb2",
          bg = "#665c54",
        },
        modified_visible = {
          fg = "#928374",
          bg = "#504945",
        },

        separator = {
          fg = "#504945",
          bg = "#282828",
        },
        separator_selected = {
          fg = "#504945",
          bg = "#282828",
        },
        separator_visible = {
          fg = "#ff0000",
          bg = "#282828",
        },

        indicator_selected = {
          fg = "#fabd2f",
          bg = "#665c54",
        },
        indicator_visible = {
          fg = "#d79921",
          bg = "#504945",
        },
    }
})
