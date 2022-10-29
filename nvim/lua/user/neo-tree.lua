vim.g.neo_tree_remove_legacy_commands = 1 -- Remove legacy commands

vim.cmd[[
    hi NeoTreeGitModified   guibg=none guifg=#b8bb26 gui=bold
    hi NeoTreeGitUnstaged   guibg=none guifg=#fabd2f gui=bold
    hi NeoTreeGitStaged     guibg=none guifg=#8ec07c gui=bold
    hi NeoTreeGitUntracked  guibg=none guifg=#d3869b gui=bold
    hi NeoTreeGitIgnored    guibg=none guifg=#7c6f64
    hi NeoTreeExpander      guibg=none guifg=#8ec07c
    hi NeoTreeDirectoryIcon guibg=none guifg=#8ec07c
    hi NeoTreeDirectoryName guibg=none guifg=#8ec07c gui=bold
    hi NeoTreeDimText       guibg=none guifg=#7c6f64
    hi NeoTreeRootName      guibg=none guifg=#8ec07c gui=bold
    hi NeoTreeFileName      guibg=none guifg=#ebdbb2
    hi NeoTreeModified      guibg=none guifg=#ebdbb2
    hi DiagnosticSignError  guibg=none guifg=#fb4934 gui=bold
    hi DiagnosticSignWarn   guibg=none guifg=#fabd2f gui=bold
    hi DiagnosticSignInfo   guibg=none guifg=#83a598 gui=bold
    hi DiagnosticSignHint   guibg=none guifg=#8ec07c gui=bold
    hi VertSplit            guibg=none guifg=#504945
    hi NeoTreeIndentMarker  guibg=none guifg=#5B7452
    hi NeoTreeFloatBorder   guibg=none guifg=#928374
    hi StatusLineNC         guibg=#504945 guifg=#504945
    hi StatusLine           guibg=#504945 guifg=none
]]

vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",  { text = "W", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "I", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "H", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
    close_if_last_window  = true,
    popup_border_style    = "rounded",
    enable_git_status     = true,
    enable_diagnostics    = true,
    sort_case_insensitive = false,
    sort_function         = nil,
    default_component_configs = {
        container = {
            enable_character_fade = true
        },
        indent = {
            indent_size        = 2,
            padding            = 1, -- extra padding on left hand side
            -- indent guides
            with_markers       = true,
            indent_marker      = "│",
            last_indent_marker = "╰",
            highlight          = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders     = true,
            expander_collapsed = "",
            expander_expanded  = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open   = "",
            folder_empty  = "",
            default       = "",
            highlight     = "NeoTreeFileIcon"
        },
        modified = {
            symbol    = "",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            highlight      = "neotreefilename",
        },
        git_status = {
                window = {
                position = "float",
                mappings = {
                    ["A"]  = "git_add_all",
                    ["gu"] = "git_unstage_file",
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                }
            },
        colors = true,
        symbols = {
            -- Change type
            added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "﫧",-- this can only be used in the git_status source
            renamed   = "凜",-- this can only be used in the git_status source
            -- Status type
            untracked = "~",
            ignored   = "",
            unstaged  = "!",
            staged    = "+",
            conflict  = "?",
            }
        },
    },
    window = {
        position = "left",
        width    = 29,
        mapping_options = {
            noremap = true,
            nowait  = true,
        },
        mappings = {
            ["<2-LeftMouse>"] = "open",
            ["l"]             = "open",
            ["S"]             = "open_split",
            ["s"]             = "open_vsplit",
            ["t"]             = "open_tabnew",
            ["w"]             = "open_with_window_picker",
            ["h"]             = "close_node",
            ["H"]             = "close_all_nodes",
            ["a"]             = { "add", config = { show_path = "none" } },
            ["A"]             = "add_directory",
            ["d"]             = "delete",
            ["r"]             = "rename",
            ["y"]             = "copy_to_clipboard",
            ["x"]             = "cut_to_clipboard",
            ["p"]             = "paste_from_clipboard",
            ["c"]             = "copy",
            ["m"]             = "move",
            ["q"]             = "close_window",
            ["R"]             = "refresh",
            ["?"]             = "show_help",
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible         = false,               -- when true, they will just be displayed differently than normal items
            hide_dotfiles   = false,
            hide_gitignored = false,
            hide_hidden     = false,               -- only works on Windows for hidden files/directories
            hide_by_name    = {},
            hide_by_pattern = {},                  -- uses glob style patterns
            never_show      = {},                  -- remains hidden even if visible is toggled to true
        },
        follow_current_file    = false,          -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
        group_empty_dirs       = false,          -- when true, empty folders will be grouped together
        hijack_netrw_behavior  = "open_default",
        use_libuv_file_watcher = false,          -- This will use the OS level file watchers to detect changes
        window = {
            mappings = {
                ["/"]     = "noop",
                ["<c-f>"] = "fuzzy_finder",
                ["-"]     = "navigate_up",
                ["."]     = "set_root",
                ["H"]     = "toggle_hidden",
                ["D"]     = "fuzzy_finder_directory",
                ["f"]     = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
            }
        }
    },
    buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
        group_empty_dirs    = true, -- when true, empty folders will be grouped together
        show_unloaded       = true,
        window = {
            mappings = {
                ["bd"]   = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."]    = "set_root",
            }
        },
    }
})
