return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    },
    opts = {
      explorer = { enabled = true, replace_netrw = true },
      picker = {
        layout = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = true, width = 0.65 },
          },
        },
        sources = {
          explorer = {
            hidden = true,
            layout = { layout = { position = "left", width = 35 } },
          },
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
