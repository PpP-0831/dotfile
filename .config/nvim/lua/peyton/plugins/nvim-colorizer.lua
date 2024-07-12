return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("colorizer").setup(
      nil, { names = false }
    )
  end
}
