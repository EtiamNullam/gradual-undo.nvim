local M = {}

local function get_cursor_position()
  return vim.fn.getpos('.')
end

function M.jump_to_last_undo_position_or_undo()
  local cursor_position_before = get_cursor_position()

  vim.api.nvim_command('undo')

  local cursor_position_after = get_cursor_position()

  if not vim.deep_equal(cursor_position_before, cursor_position_after) then
    vim.api.nvim_command('redo')

    print('gradual-undo: Jumped to last undo location')
  end
end

function M.jump_to_last_redo_position_or_redo()
  local cursor_position_before = get_cursor_position()

  vim.api.nvim_command('redo')

  local cursor_position_after = get_cursor_position()

  if not vim.deep_equal(cursor_position_before, cursor_position_after) then
    vim.api.nvim_command('undo')

    print('gradual-undo: Jumped to last redo location')
  end
end

function M.setup(opts)
  opts = opts or {}

  if opts.map_default_keys == true or opts.map_default_keys == nil then
    vim.keymap.set('n', 'u', M.jump_to_last_undo_position_or_undo)
    vim.keymap.set('n', '<c-r>', M.jump_to_last_redo_position_or_redo)
  end
end

return M
