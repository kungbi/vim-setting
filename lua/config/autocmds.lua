-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto switch to English input when leaving insert mode (macOS)
-- Requires: im-select (~/bin/im-select)
vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("auto_english_input", { clear = true }),
  callback = function()
    vim.fn.system(vim.fn.expand("~/bin/im-select") .. " com.apple.keylayout.ABC")
  end,
})
