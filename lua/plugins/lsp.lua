return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        on_attach = function(client, bufnr)
          local name = vim.api.nvim_buf_get_name(bufnr)
          local base = vim.fn.fnamemodify(name, ":t")
          if base == ".env" or base:match("^%.env%.") then
            vim.schedule(function()
              vim.lsp.buf_detach_client(bufnr, client.id)
            end)
          end
        end,
      },
      ["*"] = {
        keys = {
          { "gr", false },
          { "grr", function() Snacks.picker.lsp_references() end, desc = "References" },
        },
      },
    },
  },
}
