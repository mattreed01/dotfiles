local ts_context = require("ts_context_commentstring.integrations.comment_nvim")

return {
  'numToStr/Comment.nvim',
  dependencies = {
    "JooseAlviste/nvim-ts-context-commentstring"
  },
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  opts = {
    pre_hook = ts_context.create_pre_hook()
  }
}

