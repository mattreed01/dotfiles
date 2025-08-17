local function shouldDisable(lang, buf)
  local max_filesize = 500 * 1024 -- 500 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

  if ok and stats and stats.size > max_filesize then
    return true
  end
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    auto_install = false,
    ensure_installed = {
      "bash",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "prisma",
      "ruby",
      "sql",
      "tsx",
      "typescript",
    },
    highlight = {
      enable = true,
      disable = shouldDisable
    },
    indent = {
      enable = true,
      disable = shouldDisable
    }
  }
}
