return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    require("cmp").setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      vim.keymap.set({ "i", "s" }, "<C-L>", function() require("luasnip").jump(1) end, { silent = true }),
      mapping = require("cmp").mapping.preset.insert({
        ["<C-k>"] = require("cmp").mapping.select_prev_item(),
        ["<C-j>"] = require("cmp").mapping.select_next_item(),
        ["<C-l>"] = require("cmp").mapping.confirm({ select = true }),
      }),
      sources = require("cmp").config.sources({
        { name = "nvim_lsp" },
        { name = "neorg" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" }
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end
}
