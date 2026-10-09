-- Run: nvim --headless -u NONE -l ~/.config/nvim/tests/bashls-dotenv.lua
local config = dofile(vim.fn.expand("~/.config/nvim/lua/plugins/lsp.lua"))
local root_dir = config[1].opts.servers.bashls.root_dir
assert(type(root_dir) == "function", "bashls needs a pre-attach dotenv exclusion")
for _, name in ipairs({ ".env", ".env.local", ".env.production" }) do
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(buf, vim.fn.expand("~/") .. name)
  local called = false
  root_dir(buf, function() called = true end)
  assert(not called, "bashls must not attach to " .. name)
  vim.api.nvim_buf_delete(buf, { force = true })
end
local buf = vim.api.nvim_create_buf(true, false)
vim.api.nvim_buf_set_name(buf, vim.fn.expand("~/check.sh"))
local called = false
root_dir(buf, function() called = true end)
assert(called, "ordinary shell files must remain enabled")
print("PASS: dotenv excluded before attach; shell files enabled")
