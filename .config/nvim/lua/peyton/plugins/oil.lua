return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = false,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<Esc>"] = "actions.close",
      }
    })

    vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Open parent directory" })
  end
}
