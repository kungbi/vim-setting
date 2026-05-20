return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    },
    opts = {
      explorer = { enabled = true, replace_netrw = true },
      indent = {
        enabled = true,
        indent = {
          hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
          },
        },
        scope = { enabled = true },
        chunk = { enabled = false },
      },
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
        win = {
          list = {
            keys = {
              ["<C-h>"] = false,
            },
          },
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            layout = { layout = { position = "left", width = 35 } },
            win = {
              list = {
                keys = {
                  [">"] = function() vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) + 5) end,
                  ["<lt>"] = function() vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) - 5) end,
                },
              },
            },
          },
          files = {
            hidden = true,
            ignored = true,
            exclude = { "**/*.js" },
          },
          grep = {
            hidden = true,
            ignored = true,
            args = { "--glob", "!dist" },
          },
        },
      },
    },
  },
}
