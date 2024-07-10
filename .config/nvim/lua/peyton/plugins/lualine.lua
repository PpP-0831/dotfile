return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
          }
        },
        lualine_b = {
          {
            "filetype",
            colored = false,
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 }
          }
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 50
          }
        },
        lualine_x = {
          {
            "diff",
            symbols = { added = '+', modified = '~', removed = '-' },
          },
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
            always_visible = false,
          }
        },
        lualine_y = { { "progress" } },
        lualine_z = { { "location", separator = { left = '', right = '' } } },
      }

    })
  end
}
