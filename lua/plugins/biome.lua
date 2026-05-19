return {
  {
    "stevearc/conform.nvim",
    optional = true,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyDone",
        callback = function()
          local ok, conform = pcall(require, "conform")
          if not ok then return end
          local fts = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" }
          for _, ft in ipairs(fts) do
            conform.formatters_by_ft[ft] = { "biome" }
          end
        end,
      })
    end,
  },
}
