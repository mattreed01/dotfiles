local conf = require("telescope.config")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")

local M = {}

local finder_command_generator = function(query)
  local args = { "rg" }

  if not query or query == "" then
    return nil
  end

  local segments = vim.split(query, "  ")

  if segments[1] then
    table.insert(args, "-e")
    table.insert(args, segments[1])
  end

  if segments[2] then
    table.insert(args, "-g")
    table.insert(args, segments[2])
  end

  return vim.iter({
    args,
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case"
  }):flatten():totable()
end

local finder = function(opts)
  return finders.new_async_job({
    command_generator = finder_command_generator,
    cwd = opts.cwd,
    entry_maker = make_entry.gen_from_vimgrep(opts)
  })
end

local live_filtered_grep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  pickers.new(opts, {
    debounce = 150,
    finder = finder(opts),
    previewer = conf.values.grep_previewer(opts),
    prompt_title = "Live Filtered Grep",
    sorter = sorters.empty()
  }):find()
end

M.grep = function()
  live_filtered_grep()
end

return M
