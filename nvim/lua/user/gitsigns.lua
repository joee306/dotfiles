require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd',    text = ' ▎', numhl='GitSignsAddNr',    linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = ' ▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = ' ▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = ' ▎', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = ' ▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    signcolumn = true,
    numhl      = false,
    linehl     = false,
    word_diff  = false,
    watch_gitdir = {
        interval     = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text          = true,
        virt_text_pos      = 'eol',
        virt_text_priority = 1,
        delay              = 500,
        ignore_whitespace  = true,
    },
    current_line_blame_formatter = '   <author>, <author_time:%R>: <summary> ',
    sign_priority    = 6,
    update_debounce  = 100,
    status_formatter = nil, -- Use default
    max_file_length  = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        border   = 'rounded',
        style    = 'minimal',
        relative = 'cursor',
        row      = 0,
        col      = 1
    },
    yadm = {
        enable = false
    },

  on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
    map('n', ')', function()
      if vim.wo.diff then return ')' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '(', function()
      if vim.wo.diff then return '(' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

  -- Actions
    map("n", "<leader>a",   "<cmd>w<CR><cmd>lua require'gitsigns'.stage_hunk()   print('Hunk   staged')<CR>")
    map("n", "<leader>A",   "<cmd>w<CR><cmd>lua require'gitsigns'.stage_buffer() print('Buffer staged')<CR>")
    map("n", "<leader>uA",  gs.reset_buffer_index)
    map("n", "<leader>B",   gs.toggle_current_line_blame)
    map("n", "<leader>b",   function() gs.blame_line{full=true} end)
    map("n", "<leader>gd",  gs.preview_hunk)
    map("n", "<leader>gtd", gs.toggle_deleted)
    map("n", "<leader>gD",  gs.diffthis)

  end
}

vim.cmd[[
  hi GitSignsCurrentLineBlame guifg=#7c6f64
  hi GitSignsAddPreview       guifg=#b8bb26
  hi GitSignsChangePreview    guifg=#8ec07c
  hi GitSignsDeletePreview    guifg=#fb4934
]]
