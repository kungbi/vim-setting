return {
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.keymap.set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
      vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "kevinhwang91/nvim-hlslens", "lewis6991/gitsigns.nvim" },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.search").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
}
