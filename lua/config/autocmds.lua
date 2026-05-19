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
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.bo.filetype == "snacks_picker_list" then
      vim.defer_fn(function()
        local buf = vim.api.nvim_get_current_buf()
        pcall(vim.api.nvim_buf_del_keymap, buf, "n", "<C-h>")
        vim.keymap.set("n", "<C-h>", function()
          local cur = vim.api.nvim_get_current_win()
          local cur_col = vim.fn.getwininfo(cur)[1].wincol
          vim.cmd("wincmd h")
          local new_win = vim.api.nvim_get_current_win()
          if new_win == cur then
            vim.fn.system("tmux select-pane -L")
          else
            local new_col = vim.fn.getwininfo(new_win)[1].wincol
            if new_col > cur_col then
              vim.api.nvim_set_current_win(cur)
              vim.fn.system("tmux select-pane -L")
            end
          end
        end, { buffer = buf, nowait = true })
      end, 50)
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("auto_english_input", { clear = true }),
  callback = function()
    vim.fn.system(vim.fn.expand("~/bin/im-select") .. " com.apple.keylayout.ABC")
  end,
})

-- Keep .env files highlighted as shell, but do not run bashls on them.
-- bashls/shellcheck treats dotenv variables like DATABASE_URL as unused shell
-- variables and reports SC2034, even though apps consume them externally.
local env_lsp_group = vim.api.nvim_create_augroup("dotenv_disable_bashls", { clear = true })

local function is_dotenv_file(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local base = vim.fn.fnamemodify(name, ":t")
  return base == ".env" or base:match("^%.env%.") ~= nil
end

vim.api.nvim_create_autocmd("FileType", {
  group = env_lsp_group,
  pattern = "sh",
  callback = function(args)
    if is_dotenv_file(args.buf) then
      vim.bo[args.buf].syntax = "sh"
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = env_lsp_group,
  callback = function(args)
    if not is_dotenv_file(args.buf) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "bashls" then
      vim.lsp.buf_detach_client(args.buf, client.id)
    end
  end,
})
