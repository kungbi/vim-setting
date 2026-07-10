local javascript_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
}

local function set_javascript_formatter(formatter)
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  if not javascript_filetypes[filetype] then
    vim.notify("Biome/Prettier 선택은 JavaScript/TypeScript 버퍼에서만 사용할 수 있습니다.", vim.log.levels.WARN)
    return
  end

  vim.b[bufnr].javascript_formatter = formatter
  vim.notify(("현재 버퍼 포매터: %s"):format(formatter), vim.log.levels.INFO)
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    init = function()
      vim.api.nvim_create_user_command("UseBiome", function()
        set_javascript_formatter("biome")
      end, { desc = "Use Biome for the current JavaScript/TypeScript buffer" })

      vim.api.nvim_create_user_command("UsePrettier", function()
        set_javascript_formatter("prettier")
      end, { desc = "Use Prettier for the current JavaScript/TypeScript buffer" })

      vim.api.nvim_create_user_command("ToggleBiome", function()
        local bufnr = vim.api.nvim_get_current_buf()
        set_javascript_formatter(vim.b[bufnr].javascript_formatter == "biome" and "prettier" or "biome")
      end, { desc = "Toggle Biome and Prettier for the current buffer" })

      vim.keymap.set("n", "<leader>uB", "<cmd>ToggleBiome<cr>", {
        desc = "Toggle Biome formatter",
      })
    end,
  },
}
