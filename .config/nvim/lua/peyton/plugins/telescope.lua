return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("telescope").setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope find recent files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope list help pages" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list open buffers" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope find strings" })
  end
}
