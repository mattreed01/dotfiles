return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    opts = {
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "✚",
            deleted   = "✖",
            modified  = "",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        }
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false
        }
      }
    }
  }
}
