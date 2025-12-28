-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opts = vim.o

-- Auto Indent
opts.autoindent = true

-- Backspace
opts.backspace = "indent,eol,start"

-- Copy + Paste Clipboard
vim.schedule(function()
  opts.clipboard = "unnamedplus"
end)

-- Line Numbers
opts.number = true
opts.relativenumber = true

-- Mouse Mode
opts.mouse = "a"

-- Searching
opts.ignorecase = true
opts.smartcase = true

-- Sign Column
opts.signcolumn = "yes"

-- Tabs & Spaces
opts.expandtab = true
opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2

-- Terminal Colors
opts.termguicolors = true
opts.background = "dark"

-- Window Pane Splitting
opts.equalalways = true
opts.splitright = true
opts.splitbelow = true
opts.showtabline = 1 -- 0: Never | 1: When there is more than one tab | 2: Always
vim.tabclose = "uselast" -- left: Previous tab | uselast: Opens last opened tab
