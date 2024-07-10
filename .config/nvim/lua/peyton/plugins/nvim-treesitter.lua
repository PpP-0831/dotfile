return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true
      },
      indent = {
        enable = false
      },
      auto_install = true,
    })
  end
}
