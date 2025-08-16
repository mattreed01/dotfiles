return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    }
  },
  opts = {
    defaults = {
      file_ignore_patterns = {}
    },
    extensions = {
      fzf = {}
    },
    pickers = {
      find_files = {
        hidden = true
      }
    }
  }
}
