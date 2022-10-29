local term_opts = { silent = true }
local opts      = { silent = true, noremap = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map("", "<SPACE>", "<Nop>", opts)

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Mode indicators
-- ╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
-- │ Normal Mode       = n                                                                                                                              │
-- │ Insert Mode       = i                                                                                                                              │
-- │ Visual Mode       = v                                                                                                                              │
-- │ Visual Block Mode = x                                                                                                                              │
-- │ Terminal Mode     = t                                                                                                                              │
-- │ Command Mode      = c                                                                                                                              │
-- ╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

-- NORMAL --

-- Neo Tree
map("n", "<C-t>", "<cmd>Neotree toggle<CR>", opts) -- Toggle neo-tree
map("i", "<C-t>", "<cmd>Neotree toggle<CR>", opts) -- Toggle neo-tree
map("n", "<C-f>",  "<cmd>Neotree focus<CR>", opts) -- Toggle neo-tree
map("i", "<C-f>",  "<cmd>Neotree focus<CR>", opts) -- Toggle neo-tree

-- Show Lsp Install Info
map("n", "<A-l>", "<cmd>LspInstallInfo<CR>", opts)

-- Harpoon
map("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
map("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>",        opts)
map("n", "<leader>n", "<cmd>lua require('harpoon.ui').nav_next()<CR>",          opts)
map("n", "<leader>p", "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          opts)

-- Hop
map("n", "ff", "<cmd>HopWord<CR>",    opts)
map("n", "fg", "<cmd>HopPattern<CR>", opts)

-- Telescope
map("n", "tt", "<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>", opts)
map("n", "tg", "<cmd>Telescope live_grep  find_command=rg<CR>",                  opts)
map("n", "th", "<cmd>Telescope help_tags  find_command=rg<CR>",                  opts)
map("n", "tH", "<cmd>Telescope highlights find_command=rg<CR>",                  opts)
map("n", "tk", "<cmd>Telescope keymaps    find_command=rg<CR>",                  opts)

-- Reload colorized buffers
map("n", "<leader>C", "<cmd>ColorizerReloadAllBuffers<CR>", opts)

-- Command pallete
map("n", ";", ":", opts)

-- Comment Box
map("n", "gB", "<Cmd>lua require('comment-box').cbox()<CR>",      opts) -- Normal Center
map("v", "gB", "<Cmd>lua require('comment-box').cbox()<CR><ESC>", opts) -- Visual Center
map("n", "gb", "<Cmd>lua require('comment-box').lbox()<CR>",      opts) -- Normal Left
map("v", "gb", "<Cmd>lua require('comment-box').lbox()<CR><ESC>", opts) -- Visual Left

-- Source current file
map("n", "<leader>s", "<cmd>w<CR><cmd>source %<CR>", opts)

-- Bufferline
map("n", "<TAB>",   "<cmd>BufferLineCycleNext<CR>", opts) -- Go to next buffer
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts) -- Go to previous buffer
map("n", "<A->>",   "<cmd>BufferLineMoveNext<CR>",  opts) -- Shift buffer to the right
map("n", "<A-<>",   "<cmd>BufferLineMovePrev<CR>",  opts) -- Shift buffer to the left
map("n", "<leader>p",   "<cmd>BufferLineTogglePin<CR>", opts) -- Pin buffer

-- Indent with one key
map("n", "<", "<<", opts) -- Indent left
map("n", ">", ">>", opts) -- Indent right

-- Toggle Code Action Menu
map("n", "cm", "<cmd>CodeActionMenu<CR>", opts)

-- Create splits
map("n", "<A-h>", "<C-w>s", opts) -- Horizontal split
map("n", "<A-v>", "<C-w>v", opts) -- Vertical split

-- Better window navigation
map("n", "<C-k>", "<C-w>k", opts) -- Move up
map("n", "<C-j>", "<C-w>j", opts) -- Move down
map("n", "<C-h>", "<C-w>h", opts) -- Move left
map("n", "<C-l>", "<C-w>l", opts) -- Move right

-- Resize with arrows
map("n", "<A-J>", "<cmd>resize -1<CR>",          opts) -- Vertically resize down by 1
map("n", "<A-K>", "<cmd>resize +1<CR>",          opts) -- Vertically resize up by 1
map("n", "<A-H>", "<cmd>vertical resize -1<CR>", opts) -- Vertically resize left by 1
map("n", "<A-L>", "<cmd>vertical resize +1<CR>", opts) -- Vertically resize right by 1

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>",     opts) -- Go to next buffer
map("n", "<S-h>", "<cmd>bprevious<CR>", opts) -- Go to previous buffer

-- Enter visual block mode
map("n", "<leader>v", "<C-v>", opts)

-- Save the file
map("n", "s",         "<cmd>wa<CR>",                   opts) -- Save all buffers
map("n", "<A-s>",     "<cmd>wa<CR><cmd>qa<CR>",        opts) -- Save & Quit all buffers
map("n", "<A-x>",     "<cmd>w<CR><cmd>Bdelete! %<CR>", opts) -- Save & Quit one buffer
map("n", "<C-x>",     "<cmd>Bdelete! %<CR>",           opts) -- Save & Quit one buffer without saving
map("n", "<leader>x", "<cmd>q!<CR>",                   opts) -- Quit all buffers without saving

-- Execute line as a bash command
map("n", "<leader><Enter>", "<cmd>.!bash<CR><CR>k", opts)

-- Go to line extremes
map("n", "<A-i>", "0", opts) -- Go to begining
map("n", "<A-o>", "$", opts) -- Go to end

-- Select all text
map("n", "<C-a>", "gg0vG$", opts)

-- Search and Replace
map("n", "<leader>r", ":%s//g<Left><Left>", opts)

-- Increment numbers
map("n", "=", "<C-a>", opts) -- Increase value
map("n", "-", "<C-x>", opts) -- Decrease value

-- Move to middle while scrolling to bottom
map("n", "G", "Gzz", opts)

-- Add spaces
map("n", ",", "i<SPACE><ESC>", opts)

-- Change selected brackets
map("n", "<A-o>", "zc", opts)
map("n", "<A-p>", "zo", opts)

-- Change all brackets
map("n", "<A-O>", "zM", opts)
map("n", "<A-P>", "zR", opts)

-- Move text up and down
map("n", "<A-j>", "<cmd>m .+1<CR>", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>", opts)

-- Start plugin EasyAlign
map("n", "ga", "<Plug>(EasyAlign)", opts)

-- Copy to system clipboard
map('n', '<C-c>', '\"+y', opts)
map('v', '<C-c>', '\"+y', opts)

-- Paste to system clipboard
map('n', '<C-v>', '\"+p', opts)
map('v', '<C-v>', '\"+p', opts)

-- Number every line
map('n', '<leader><C-i>', '<cmd>!numrename_file %<CR>', opts)
map('n', '<leader><C-a>', '<cmd>!numrename_file % -a<CR>', opts)


-- UFO
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', 'K', function()
local winid = require('ufo').peekFoldedLinesUnderCursor()
if not winid then
vim.lsp.buf.hover()
end
end)

-- INSERT --

-- Press jj to enter visual mode
map("i", "jj", "<ESC>", opts)

-- VISUAL --

-- Stay in indent mode
map("v", "<", "<gv", opts) -- Indent left
map("v", ">", ">gv", opts) -- Indent right

-- High Str
map("v", "<leader>0", ":<C-u>HSHighlight 0<CR>",                               opts) -- Highlight with color 0
map("v", "<leader>1", ":<C-u>HSHighlight 1<CR>",                               opts) -- Highlight with color 1
map("v", "<leader>2", ":<C-u>HSHighlight 2<CR>",                               opts) -- Highlight with color 2
map("v", "<leader>3", ":<C-u>HSHighlight 3<CR>",                               opts) -- Highlight with color 3
map("v", "<leader>4", ":<C-u>HSHighlight 4<CR>",                               opts) -- Highlight with color 4
map("v", "<leader>5", ":<C-u>HSHighlight 5<CR>",                               opts) -- Highlight with color 5
map("v", "<leader>R", ":<C-u>HSRmHighlight<CR>:ColorizerReloadAllBuffers<CR>", opts) -- Unhighlight

-- Move text up and down
map("v", "<A-k>", ":move -2<CR>gv-gv", opts)
map("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)

-- Search and replace
map("v", "<leader>r", ":s//g<Left><Left>", opts)

-- VISUAL BLOCK --

-- Start plugin EasyAlign
map("x", "ga", "<Plug>(EasyAlign)", opts)

-- Add spaces
map("x", ",", "I<SPACE><ESC>gv", opts)

-- TERMINAL --

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
