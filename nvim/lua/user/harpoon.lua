require("harpoon").setup({
    mark_branch = true,
    menu = { width = vim.api.nvim_win_get_width(0) - 26 }
})

vim.cmd[[
    hi HarpoonBorder guifg=#fabd2f
    hi HarpoonWindow guifg=#a89984
]]
