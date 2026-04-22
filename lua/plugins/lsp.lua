return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "gr", false },
          { "grr", function() Snacks.picker.lsp_references() end, desc = "References" },
        },
      },
    },
  },
}
