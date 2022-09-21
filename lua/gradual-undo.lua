M = {}

local function get_cursor_position()
  return vim.fn.getpos('.')
end

function M.jump_to_last_undo_position_or_undo()
  local cursor_position_before = get_cursor_position()

  vim.api.nvim_command('undo')

  local cursor_position_after = get_cursor_position()

  for index = 1, #cursor_position_before, 1 do
    if cursor_position_before[index] ~= cursor_position_after[index] then
      vim.api.nvim_command('redo')

      return
    end
  end
end

function M.setup(opts)
  opts = opts or {}

  if opts.map_default_keys == true or opts.map_default_keys == nil then
    vim.keymap.set('n', 'u', M.jump_to_last_undo_position_or_undo)
  end
end

return M
