return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black",
        "tree-sitter-cli"
      }
    })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = "*.py",
      callback = function()
        local filename = vim.fn.expand("%")
        vim.cmd("silent !black " .. filename)
      end,
    })
  end
}
