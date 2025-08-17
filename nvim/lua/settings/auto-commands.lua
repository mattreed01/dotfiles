local ts_omnifunc = require('extensions.telescope.omnifunc')

local autosave_group = vim.api.nvim_create_augroup("autosave", { clear = true })
local highlight_group = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
local lsp_attach_group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
local lsp_autoformat_group = vim.api.nvim_create_augroup("lsp-autoformat", { clear = true })

local ts_auto_complete = function()
  vim.schedule(function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    ts_omnifunc.auto_complete()
  end)
end

-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
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
          vim.keymap.set("i", "<M-]>", ts_auto_complete, { desc = "Extended telescope omnifunc", noremap = true })
        end,
        desc = "Auto format before write",
        group = lsp_autoformat_group
      })
    end
  end,
  desc = "On LSP Attach - Prepare Auto Formatter",
  group = lsp_attach_group
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Highlight when yanking (copying) text",
  group = highlight_group
})

-- Save on insert exit
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertLeave" }, {
  callback = function(args)
    local buffer = args.buf

    if vim.bo[buffer].buftype == "" then
      vim.api.nvim_buf_call(buffer, function()
        vim.cmd("silent! write")
      end)
    end
  end,
  desc = "Write after exiting insert mode",
  group = autosave_group
})
