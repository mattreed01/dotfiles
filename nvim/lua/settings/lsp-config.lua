local lsps_to_enable = {
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

for _, lsp in pairs(lsps_to_enable) do
  vim.lsp.enable(lsp)
end
