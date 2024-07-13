return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "odyssey",
          path = "~/Documents/Obsidian/Odyssey",
        },
      },

      notes_subdir = "01-Notes",
      new_notes_location = "current_dir",
      templates = {
        folder = "00-Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      daily_notes = {
        folder = "02-Journals",
        date_format = "%Y/%m-%B/%Y-%m-%d-%a",
        default_tags = { "journal" },
        template = "Journal.md",
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true, desc = "Obsidian gf passthrough" },
        },
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = "Obsidian toggle checkbox" },
        },
        ["<leader>ft"] = {
          action = function()
            return vim.cmd("ObsidianTags todo")
          end,
          opts = { desc = "Obsidian view todos" },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true, desc = "Obsidian smart action" },
        }
      },

      ui = {
        enable = true,
      },

      note_id_func = function(title)
        return title
      end,

      note_frontmatter_func = function(note)
        local datetime = os.date("%Y-%m-%d %H:%M")
        local format = { tags = note.tags, modified = datetime }
        return format
      end,
    })
  end
}
