local fn = vim.fn

-- Automatically install packer

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then

    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }

    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]

end

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use

local status_ok, packer = pcall(require, "packer")

if not status_ok then

    return

end

-- Have packer use a popup window

packer.init { display = { open_fn = function() return require("packer.util").float({ border = "rounded" }) end } }

-- Install your plugins here

return packer.startup(function(use)

    -- General
    use 'folke/tokyonight.nvim'
    use "wbthomason/packer.nvim"              -- Have packer manage itself
    use "nvim-lua/popup.nvim"                 -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"               -- Useful lua functions used by lots of plugins
    use "junegunn/vim-easy-align"             -- Align objects easily
    use "karb94/neoscroll.nvim"               -- Smooth scrolling
    use "nvim-lualine/lualine.nvim"           -- Lualine
    use "akinsho/toggleterm.nvim"             -- Use terminal inside nvim better
    use "akinsho/bufferline.nvim"             -- Show Buffers
    use "moll/vim-bbye"                       -- Delete buffers
    use "xiyaowong/nvim-transparent"          -- Make neovim transparent
    use "NvChad/nvim-colorizer.lua"           -- Colorizer
    use "folke/which-key.nvim"                -- Emacs like key finder
    use "lewis6991/gitsigns.nvim"             -- Show git diffs
    use "phaazon/hop.nvim"                    -- Easymotion
    use "Pocco81/HighStr.nvim"                -- Highlighter
    use "goolord/alpha-nvim"                  -- Add start page
    use "antoinemadec/FixCursorHold.nvim"     -- Fix CursorHold
    use "lukas-reineke/indent-blankline.nvim" -- Show indent lines
    use "weilbith/nvim-code-action-menu"      -- Code actions popup
    use "numToStr/Comment.nvim"               -- Comment and uncomment lines
    use "LudoPinelli/comment-box.nvim"        -- Add comment boxes
    use "RRethy/vim-illuminate"               -- Highlight word under cursor
    use "ThePrimeagen/harpoon"                -- Navigate through a set of commmonly acccessed files
    use "tpope/vim-surround"                  -- Surround
    use "baskerville/vim-sxhkdrc"             -- Syntax highlighting for sxhkdrc
    use {                                     -- Symbol bar
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}

    use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }            -- Telescope
    -- Package dependencies: fd-find ripgrep

    use { "kevinhwang91/nvim-ufo",            -- Nvim Folding
        requires = "kevinhwang91/promise-async"
    }
    use { "nvim-neo-tree/neo-tree.nvim",      -- Neotree
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Color Schemes
    use "ellisonleao/gruvbox.nvim"

    -- CMP
    use "hrsh7th/nvim-cmp"                 -- Completion plugin
    use "hrsh7th/cmp-buffer"               -- Buffer Completions
    use "hrsh7th/cmp-path"                 -- Path Completions
    use "hrsh7th/cmp-cmdline"              -- Cmdline Completions
    use "hrsh7th/cmp-nvim-lsp"             -- LSP Completion
    use "hrsh7th/cmp-nvim-lua"             -- LUA Completion
    use "saadparwaiz1/cmp_luasnip"         -- Snippet Completions

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"


    -- Snippets
    use "L3MON4D3/LuaSnip"                 -- Snippet Engine

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "p00f/nvim-ts-rainbow"             -- Rainbow parentheses

  if PACKER_BOOTSTRAP then

    require("packer").sync()

  end
end)
