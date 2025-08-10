-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Editor preferences
require("settings.editor-preferences")

-- Package Manager Setup
require("config.lazy")

-- LSP Enabler
require("settings.lsp-config")

-- Key mappings
require("settings.keymaps")

-- Auto commands
require("settings.auto-commands")
