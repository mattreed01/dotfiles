-- Auto Indent
vim.o.autoindent = true

-- Backspace
vim.o.backspace = "indent,eol,start"

-- Block Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 3

-- Copy + Paste Clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse Mode
vim.o.mouse = "a"

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sign Column
vim.o.signcolumn = 'yes'

-- Tabs & Spaces
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Terminal Colors
vim.o.termguicolors = true
vim.o.background = "dark"

-- Window Pane Splitting
vim.o.equalalways = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showtabline = 1 -- 0: Never | 1: When there is more than one tab | 2: Always
vim.tabclose = "uselast" -- left: Previous tab | uselast: Opens last opened tab
