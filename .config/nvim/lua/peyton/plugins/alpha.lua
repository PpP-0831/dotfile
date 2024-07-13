return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local startify = require("alpha.themes.startify")
    startify.section.header.val = {
      "", "",
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    }
    startify.opts.layout[1].val = 2
    startify.opts.opts.margin = 10
    startify.section.mru.val = { { type = "padding", val = 0 } }
    startify.section.top_buttons.val = {
      startify.button("c", " > Configuration", "<CMD>cd $HOME/.config/nvim<CR>"),
      startify.button("d", " > Dotfiles", "<CMD>cd $HOME/Dotfiles<CR>"),
      startify.button("n", " > Obsidian Vault", "<CMD>cd $HOME/Documents/Obsidian/Odyssey/01-Notes<CR><CMD>e ../index.md<CR>"),
      startify.button("p", " > Plugins", "<CMD>Lazy<CR>"),
    }
    require("alpha").setup(startify.config)
  end
}
