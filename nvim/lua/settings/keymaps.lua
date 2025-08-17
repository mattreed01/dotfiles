local ts_filtered_grep = require('extensions.telescope.filtered-grep')
local ts_builtin = require('telescope.builtin')
local which_key = require('which-key')

local lsp_buf = vim.lsp.buf

local format = function()
  vim.lsp.buf.format({ async = true })
end

local map_key = function(mode, key, map, opts)
  vim.keymap.set(mode, key, map, opts)
end

local show_which_key = function()
  which_key.show({ global = false })
end

-- Lazygit
map_key("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- LSP
map_key("n", "K", lsp_buf.hover, { desc = "Show hover tooltip" })
map_key("n", "<leader>gD", lsp_buf.declaration, { desc = "Go to declaration" })
map_key("n", "<leader>gd", ts_builtin.lsp_definitions, { desc = "Go to definition (Telescope)" })
map_key("n", "<leader>gi", ts_builtin.lsp_implementations, { desc = "Go to implementation (Telescope)" })
map_key("n", "<leader>td", ts_builtin.lsp_type_definitions, { desc = "Show type definition (Telescope)" })
map_key("n", "<leader>tr", ts_builtin.lsp_references, { desc = "Show references (Telescope)" })
map_key({ "n", "v" }, "<leader>ca", lsp_buf.code_action, { desc = "Show code actions" })
map_key("n", "<leader>F", format, { desc = "Format file" })

-- Neotree
map_key("n", "<leader>e", "<cmd>Neotree filesystem reveal right<CR>", { desc = "Open explorer" })
map_key("n", "<leader>ec", "<cmd>Neotree filesystem action=close<CR>", { desc = "Close explorer" })

-- Searching
map_key("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })

-- Telescope
map_key("n", "<leader>ff", ts_builtin.find_files, { desc = "Telescope find files" })
map_key("n", "<leader>fg", ts_filtered_grep.grep, { desc = "Extended telescope live filtered grep" })
map_key("n", "<leader>fb", ts_builtin.buffers, { desc = "Telescope buffers" })
map_key("n", "<leader>fc", ts_builtin.current_buffer_fuzzy_find, { desc = "Telescope find in current buffer" })
map_key("n", "<leader>fh", ts_builtin.help_tags, { desc = "Telescope help tags" })
map_key("n", "<leader>fl", ts_builtin.loclist, { desc = "Telescope open location list" })
map_key("n", "<leader>fq", ts_builtin.quickfix, { desc = "Telescope open quickfix list" })
map_key("n", "<leader>fs", ts_builtin.grep_string, { desc = "Telescope find string under cursor" })

-- Trouble
map_key("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map_key("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map_key("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=true<CR>", { desc = "Symbols (Trouble)" })
map_key(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focuse=true  win.position=bottom<CR>",
  { desc = "LSP Definitions / References / ... (Trouble)" }
)
map_key("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List(Trouble)" })
map_key("n", "<leader>xQ", "<cmd>Trouble qflist toggle focus=true<CR>", { desc = "Quickfix List (Trouble)" })

-- Which Key
map_key("n", "<C-?>", show_which_key, { desc = "Buffer local keymaps" })

-- Windows & Tabs
map_key("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open tab" })
map_key("n", "<leader>tc", "<cmd>tabclose!<CR>", { desc = "Close tab" })
map_key("n", "<leader>tC", "<cmd>tabonly!<CR>", { desc = "Close all inactive tabs" })
map_key("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
map_key("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
map_key("n", "<leader>tml", "<cmd>tabm -1 <CR>", { desc = "Move tab backward" })
map_key("n", "<leader>tmr", "<cmd>tabm +1 <CR>", { desc = "Move tab forward" })
map_key("n", "<leader>wv", "<cmd>vs<CR>", { desc = "Split window vertically" })
map_key("n", "<leader>wh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map_key("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close window split" })
map_key("n", "<leader>w=", "<C-w>=", { desc = "Equalize window splits" })
map_key("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map_key("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map_key("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map_key("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map_key("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map_key("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
