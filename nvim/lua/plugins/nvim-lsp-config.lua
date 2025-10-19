return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    'saghen/blink.cmp',
    ft = "lua",
    opts = {
      library = {
        {
          path = "${3rd}/luv/library",
          words = { "vim%.uv" }
        },
      },
    },
  }
}
