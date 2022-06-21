-- Utilities

-- Focus on next window
local function blur()
  local my_window = vim.api.nvim_get_current_win()
  local windows = vim.api.nvim_list_wins()
  for _, window in pairs(windows) do
    if window ~= my_window then
      vim.api.nvim_set_current_win(window)
      return
    end
  end
end

-- Create an empty new buffer, and then open nvim-tree.lua
-- Then, if cmd is not nil, execute it
local function startup_cmd(cmd)
  -- Create an empty new buffer
  local status_ok_bbye, _ = pcall(vim.cmd, "Bdelete")
  if not status_ok_bbye then
    pcall(vim.cmd, "bdelete")
  end

  -- Open nvim-tree.lua, then focus on the empty buffer
  local status_ok_tree, tree = pcall(require, "nvim-tree")
  if status_ok_tree then
    tree.open()
  end
  blur()

  -- Execute cmd
  if cmd ~= nil then
    pcall(vim.cmd, cmd)
  end
end

return {
  blur = blur,
  startup_cmd = startup_cmd
}
