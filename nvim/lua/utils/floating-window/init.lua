local M = {}
local state = {
  floating = { buffer = -1, window = -1 }
}

local close_floating_window = function()
  local floating_window = state.floating.window

  if vim.api.nvim_win_is_valid(floating_window) then
    vim.api_nvim_win_close(floating_window)
  end

  state.floating.window = -1
end

local delete_floating_window_buffer = function()
  local floating_buffer = state.floating.buffer

  if vim.api.nvim_buf_is_valid(floating_buffer) then
    vim.api_nvim_buf_delete(floating_buffer)
  end

  state.floating.buffer = -1
end

local get_buffer = function()
  local buffer = state.floating.buffer

  if vim.api.nvim_buf_is_valid(buffer) then
    return buffer
  else
    return vim.api.nvim_create_buf(false, true)
  end
end

local handle_floating_window = function(opts)
  local buffer = get_buffer()
  local ui = vim.api.nvim_list_uis()[1]
  local height = math.floor((opts and opts.height or ui.height * 0.8))
  local width = math.floor((opts and opts.width or ui.width * 0.8))
  local col = math.floor((ui.width - width) / 2)
  local row = math.floor((ui.height - height) / 2)
  local window = vim.api.nvim_open_win(buffer, true, {
    border = 'rounded',
    col = col,
    height = height,
    relative = 'editor',
    row = row,
    style = 'minimal',
    width = width
  })

  return { buffer = buffer, window = window }
end

local toggle_floating_window = function()
  if not vim.api.nvim_win_is_valid(state.floating.window) then
    state.floating = handle_floating_window()
  else
    vim.api.nvim_win_hide(state.floating.window)
  end
end

M.state = state
M.close_floating_window = close_floating_window
M.delete_floating_buffer = delete_floating_window_buffer
M.toggle_floating_window = toggle_floating_window

return M
