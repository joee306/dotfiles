local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
  return
end

toggleterm.setup({
    size            = 20,
    open_mapping    = [[<A-z>]],
    hide_numbers    = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor  = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size    = true,
    direction       = "float",
    close_on_exit   = true,
    shell           = vim.o.shell,
    float_opts = {
        border = "rounded",
    },
    highlights = {
        Normal = {
            guibg  = "#fabd2f",
        },
        NormalFloat = {
            link = 'Normal'
        },
        FloatBorder = {
            guifg = "#7c6f64",
            guibg = "NONE",
        },
    },
})
