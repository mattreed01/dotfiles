local conf = require("telescope.config")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")

local M = {}

local omnifunc_base = function(omnifunc)
  local start_col = vim.call(omnifunc, 1, "")

  if type(start_col) ~= "number" then
    return nil
  end

  local current_line = vim.api.nvim_get_current_line()
  local cursor_byte_index = vim.fn.col(".") - 1
  local base = ""

  if cursor_byte_index > 0 and start_col >= 0 and start_col < cursor_byte_index then
    base = current_line:sub(start_col + 1, cursor_byte_index)
  end

  return base
end

local omnifunc_results = function(omnifunc, base)
  local results = vim.call(omnifunc, 0, base)

  if type(results) ~= "table" then
    return {}
  end

  if results.words and type(results.words) == "table" then
    return results.words
  end

  vim.inspect(results)

  return results
end

local make_entry = function(item)
  if type(item) == "table" then
    local kind = item.kind or ""
    local menu = item.menu or ""
    local word = item.word or ""
    local display = item.abbr or word

    if kind ~= "" then
      display = display .. " [" .. kind .. "]"
    end

    if menu ~= "" then
      display = display .. " <" .. menu .. ">"
    end

    return { display = display, ordinal = word, value = word }
  else
    return { display = item, ordinal = item, value = item }
  end
end

local omnifunc_values = function()
  local omnifunc = vim.api.nvim_get_option_value("omnifunc", {}) or ""

  if omnifunc == "" then
    print('[omnifunc_values]: Omnifunc empty')

    return {}
  end

  local base = omnifunc_base(omnifunc)

  if base == nil then
    print('[omnifunc_values]: Base nil')

    return {}
  end

  return omnifunc_results(omnifunc, base)
end

local finder = function(_)
  local results = omnifunc_values()

  vim.inspect(results)

  return finders.new_table({
    entry_maker = make_entry,
    results = results,
  })
end

local omni_auto_complete = function(opts)
  opts = opts or {}

  vim.inspect(opts)

  pickers.new(opts, {
    debounce = 150,
    finder = finder(opts),
    prompt_title = "Omni Auto Complete",
    sorter = conf.values.generic_sorter()
  }):find()
end

M.auto_complete = omni_auto_complete

return M
