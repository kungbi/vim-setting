return {
  -- Disable LazyVim's default ts_ls setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = { enabled = false },
        vtsls = { enabled = false },
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client, bufnr)
        vim.schedule(function()
          vim.keymap.set("n", "gd", function()
            local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
            client:request("workspace/executeCommand", {
              command = "_typescript.goToSourceDefinition",
              arguments = { params.textDocument.uri, params.position },
            }, function(_, result)
              if result and #result > 0 then
                vim.lsp.util.show_document(result[1], client.offset_encoding, { focus = true })
              else
                Snacks.picker.lsp_definitions()
              end
            end, bufnr)
          end, { buffer = bufnr, desc = "Go to Source Definition" })
        end)
      end,
    },
  },
}
