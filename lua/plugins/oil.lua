return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = false,
    },
    keys = {
      { "<leader>=", "<cmd>Oil<cr>", desc = "Open Oil (cwd)" },
    },
  },
}
