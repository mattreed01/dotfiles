return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "bashls",
      "biome",
      "html",
      "jsonls",
      "lua_ls",
      "prismals",
      "tailwindcss",
      "ts_ls",
      "vimls"
    }
  }
}