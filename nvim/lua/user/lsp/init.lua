local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

vim.cmd[[
    highlight! link LspReferenceText  None
    highlight! link LspReferenceRead  None
    highlight! link LspReferenceWrite None
]]

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
