local function javascript_formatter(bufnr)
  return { vim.b[bufnr].javascript_formatter == "biome" and "biome" or "prettier" }
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prisma",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        prisma = { "prettier" },
        typescript = javascript_formatter,
        typescriptreact = javascript_formatter,
        javascript = javascript_formatter,
        javascriptreact = javascript_formatter,
      },
    },
  },
}
