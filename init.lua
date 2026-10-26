vim.env.PATH = "/opt/homebrew/bin:/usr/bin:/bin:" .. vim.env.PATH

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local ts_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
local ts_root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }

local node = vim.fn.exepath("node")
local tsc = vim.fn.exepath("tsc")

if node ~= "" and tsc ~= "" then
  vim.lsp.config("ts7", {
    cmd = { node, tsc, "--lsp", "--stdio" },
    filetypes = ts_filetypes,
    root_markers = ts_root_markers,
  })

  vim.lsp.enable("ts7")
end
