-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local ts_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
local ts_root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }

vim.lsp.config("ts7", {
  cmd = {
    "/Users/linkareer_123/.hermes/node/bin/node",
    "/Users/linkareer_123/.local/share/nvim/ts7-lsp/node_modules/typescript/bin/tsc",
    "--lsp",
    "--stdio",
  },
  filetypes = ts_filetypes,
  root_markers = ts_root_markers,
})

vim.lsp.enable("ts7")
