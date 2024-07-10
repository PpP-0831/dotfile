return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>ld", "<CMD>Trouble diagnostics toggle<CR>",              desc = "Trouble toggle diagnostics" },
    { "<leader>lD", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble toggle buffer diagnostics" },
    { "<leader>ls", "<CMD>Trouble symbols toggle<CR>",                  desc = "Trouble toggle document symbols" },
    { "<leader>lt", "<CMD>Trouble lsp toggle<CR>",                      desc = "Trouble toggle LSP definitions / references / ..." },
  },

  opts = {
    modes = {
      diagnostics = {
        focus = true,
        auto_close = true,
        win = {
          size = 0.2,
        },
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
      },
      symbols = {
        focus = true,
        auto_close = true,
        win = {
          position = "right",
          size = 0.3,
        },
      },
      lsp = {
        focus = true,
        auto_close = true,
        win = {
          position = "right",
          size = 0.3,
        },
      },
    }
  }
}
