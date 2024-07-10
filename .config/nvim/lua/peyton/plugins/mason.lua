return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },

  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "bashls",
        "cssls",
        "jsonls",
        "glsl_analyzer",
        "pyright",
        "lua_ls",
        "tsserver",
      },
    })
  end
}
