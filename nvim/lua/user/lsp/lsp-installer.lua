require("nvim-lsp-installer").setup{
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        border = "rounded",
        icons = {
            server_installed   = "",
            server_pending     = "",
            server_uninstalled = "",
        },
    }
}

local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    opts = require("user.lsp.settings.sumneko_lua")
}

lspconfig.clangd.setup {
    on_attach = require("user.lsp.handlers").on_attach,
}

lspconfig.pyright.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    opts = require("user.lsp.settings.pyright")
}

lspconfig.jsonls.setup {
    on_attach = require("user.lsp.handlers").on_attach,
    opts = require("user.lsp.settings.jsonls")
}

lspconfig.bashls.setup {
    on_attach = require("user.lsp.handlers").on_attach,
}

lspconfig.texlab.setup {
    on_attach = require("user.lsp.handlers").on_attach,
}

lspconfig.rust_analyzer.setup {
    on_attach = require("user.lsp.handlers").on_attach,
}
