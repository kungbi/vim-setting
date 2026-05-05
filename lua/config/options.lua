-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10

-- tmux 히스토리 클리어 (버전 쿼리 응답이 입력으로 새어드는 현상 방지)
if vim.env.TMUX then
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      vim.fn.system("tmux clear-history")
    end,
  })
end

-- tmux 안에서 OSC 52 대신 pbcopy/pbpaste 직접 사용
if vim.env.TMUX then
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
    paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
    cache_enabled = 0,
  }
end
