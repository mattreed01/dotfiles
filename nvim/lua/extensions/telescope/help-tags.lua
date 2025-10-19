local ts_actions = require('telescope.actions')
local ts_action_state = require('telescope.actions.state')
local ts_builtin = require('telescope.builtin')
local ts_utils = require('telescope.utils')

local floating_window = require('utils.floating-window')

local M = {}

local get_hidden_help_buffer = function(value)
  local current_window = vim.api.nvim_get_current_win()

  vim.cmd("noautocmd silent keepalt help " .. value)

  local help_buffer = vim.api.nvim_get_current_buf()
  local help_window = vim.api.nvim_get_current_win()
  local buffer_contents = vim.api.nvim_buf_get_lines(help_buffer, 0, -1, false)

  vim.api.nvim_set_current_win(current_window)
  vim.api.nvim_win_close(help_window, true)

  return buffer_contents
end

local set_floating_window_contents = function(value)
  local buffer = floating_window.state.floating.buffer
  local window = floating_window.state.floating.window

  vim.api.nvim_set_option_value("modifiable", true, { buf = buffer })
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, {})
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, value)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buffer })
  vim.api.nvim_set_option_value("filetype", "help", { buf = buffer })

  vim.keymap.set(
    "n", "q",
    function()
      vim.api.nvim_win_hide(window)
    end,
    { buffer = buffer, nowait = true }
  )
end

local attach_action_mappings = function(prompt_buffer_no, _)
  ts_actions.select_default:replace(function()
    local selection = ts_action_state.get_selected_entry()

    if selection == nil then
      ts_utils.__warn_no_selection "builtin.help_tags"

      return false
    end

    ts_actions.close(prompt_buffer_no)
    floating_window.toggle_floating_window()
    set_floating_window_contents(get_hidden_help_buffer(selection.value))
  end)

  return true
end

local help_tags = function()
  ts_builtin.help_tags({ attach_mappings = attach_action_mappings })
end

M.help_tags = help_tags

return M
