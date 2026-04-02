return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = { "**/*.js" },
          },
          grep = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
