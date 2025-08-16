-- Lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- LSP
local function format()
  vim.lsp.buf.format { async = true }
end

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover tooltip" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "Show type definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set("n", "<leader>F", format, { desc = "Format file" })

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal right<CR>", { desc = "Open explorer" })
vim.keymap.set("n", "<leader>ec", "<cmd>Neotree filesystem action=close<CR>", { desc = "Close explorer" })

-- Searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Which Key
local function whichKey()
  require("which-key").show({ global = false })
end

vim.keymap.set("n", "<C-?>", whichKey, { desc = "Buffer local keymaps" })

-- Windows & Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose!<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tC", "<cmd>tabonly!<CR>", { desc = "Close all inactive tabs" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
vim.keyma.set("n", "<leader>tR", "<cmd>tabm -1 <CR>", { desc = "Move tab backward" })
vim.keyma.set("n", "<leader>tr", "<cmd>tabm +1 <CR>", { desc = "Move tab forward" })
vim.keymap.set("n", "<leader>wv", "<cmd>vs<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close window split" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize window splits" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
