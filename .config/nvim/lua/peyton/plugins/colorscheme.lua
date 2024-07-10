return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      color_overrides = {
        -- a custom/extended version of the paradise colorscheme
        macchiato = {
          rosewater = "#d9b3ae",
          flamingo  = "#cfa09a",
          pink      = "#B88498",
          mauve     = "#A988B0",
          red       = "#B66467",
          maroon    = "#A0555A",
          peach     = "#C7987A",
          yellow    = "#D9BC8C",
          green     = "#8C977D",
          teal      = "#8AA6A2",
          sky       = "#8CA5AE",
          sapphire  = "#8DA3B9",
          blue      = "#8D9FB9",
          lavender  = "#A59FBC",
          text      = "#E8E3E3",
          subtext1  = "#D6D2D2",
          subtext0  = "#C4C1C1",
          overlay2  = "#BBB6B6",
          overlay1  = "#A09F9F",
          overlay0  = "#8E8E8E",
          surface2  = "#424242",
          surface1  = "#343434",
          surface0  = "#2D2D2D",
          base      = "#111111",
          mantle    = "#101010",
          crust     = "#010101",
        },
        -- darker catppuccin mocha
        mocha = {
          base   = "#12121c",
          mantle = "#110c14",
          crust  = "#0c050a",
        },
        -- the nordic colorscheme
        frappe = {
          rosewater = "#d9b3ae",
          flamingo  = "#cfa09a",
          pink      = "#B88498",
          mauve     = "#A97EA1",
          red       = "#BF616A",
          maroon    = "#B74E58",
          peach     = "#D08770",
          yellow    = "#EBCB8B",
          green     = "#A3BE8C",
          teal      = "#8FBCBB",
          sky       = "#88C0D0",
          sapphire  = "#9FC6C5",
          blue      = "#5E81AC",
          lavender  = "#BE9DB8",
          text      = "#ECEFF4",
          subtext1  = "#E5E9F0",
          subtext0  = "#D8DEE9",
          overlay2  = "#BBC3D4",
          overlay1  = "#C0C8D8",
          overlay0  = "#434C5E",
          surface2  = "#384252",
          surface1  = "#2E3440",
          surface0  = "#242933",
          base      = "#191D24",
          mantle    = "#191D24",
          crust     = "#191D24",
        },
      }
    }

    vim.cmd("colorscheme catppuccin-macchiato")
    -- Some custom changes
    vim.cmd("hi @comment.error guifg=#B66467 guibg=none")
  end
}
