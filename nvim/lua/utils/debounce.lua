local debounce_timers = {}

local debounce = function(bufnr, fn, timeout)
  if debounce_timers[bufnr] then
    vim.uv.timer_stop(debounce_timers[bufnr])
    debounce_timers[bufnr]:close()
  end

  local timer = vim.uv.new_timer()

  if not timer then return end

  timer:start(timeout, 0, vim.schedule_wrap(function()
    fn()
    timer:close()

    debounce_timers[bufnr] = nil
  end))

  debounce_timers[bufnr] = timer
end

return debounce
