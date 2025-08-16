-- Format on save
vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if not client then return end

      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({
              bufnr = args.buf,
              id = client.id
            })
          end
        })
      end
    end
  }
)

-- Highlight On Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
