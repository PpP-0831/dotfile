return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = true,
    cmd = "Neorg",
    keys = {
      { "<leader>nn", "<CMD>Neorg index<CR>", desc = "Open Neorg index file" },
      { "<leader>nj", "<CMD>Neorg journal today<CR>", desc = "Open today's Neorg journal" },
    },
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.summary"] = {},
          ["core.integrations.nvim-cmp"] = {},
          ["core.concealer"] = {
            config = {
              icons = {
                code_block = {
                  conceal = true,
                  padding = { left = 2, right = 2 },
                },
                todo = {
                  cancelled = { icon = "" },
                  done      = { icon = "" },
                  on_hold   = { icon = "" },
                  pending   = { icon = "" },
                  recurring = { icon = "" },
                  uncertain = { icon = "" },
                  undone    = { icon = "" },
                  urgent    = { icon = "" },
                },
              }
            }
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            }
          },
          ["core.journal"] = {
            config = {
              journal_folder = "Journal",
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                Zenith = "~/Documents/Neorg/Zenith",
              },
              default_workspace = "Zenith",
            },
          },
        },
      })

      vim.cmd("autocmd BufRead,BufNewFile *.norg setlocal conceallevel=2")
    end
  }
}