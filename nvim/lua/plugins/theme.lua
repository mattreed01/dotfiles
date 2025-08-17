--[[
  Theme options:
  colorscheme tokyonight-night
  colorscheme tokyonight-storm
  colorscheme tokyonight-day
  colorscheme tokyonight-moon
]] --

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    vim.cmd.colorscheme "tokyonight-storm"
  end,

}

