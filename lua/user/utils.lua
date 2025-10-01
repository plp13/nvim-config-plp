-- Utilities

local _notify_orig = vim.notify

-- Disable all notifications that contain "deprecated"
local function depr_notify_disable()
  local _notify_filter = function(text, level, opts)
    if type(text) == "string" and string.find(text, "deprecated", 1, true) then
      return
    end

    _notify_orig(text, level, opts)
  end

  vim.notify = _notify_filter
end

-- Re-enable all notifications that contain "deprecated"
local function depr_notify_enable()
  vim.notify = _notify_orig
end

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
  local status_ok_tree_api, tree_api = pcall(require, "nvim-tree.api")
  if status_ok_tree_api then
    tree_api.tree.open()
  end
  blur()

  -- Execute cmd
  if cmd ~= nil then
    pcall(vim.cmd, cmd)
  end
end

-- If current buffer is associated a file or a directory, open nvim-tree.lua
local function open_nvim_tree(data)
  local is_file = vim.fn.filereadable(data.file) == 1
  local is_directory = vim.fn.isdirectory(data.file) == 1

  if (not is_file) and (not is_directory) then
    return
  end

  local status_ok_tree_api, tree_api = pcall(require, "nvim-tree.api")
  if status_ok_tree_api then
    tree_api.tree.open()
  end
  blur()
end

return {
  depr_notify_disable = depr_notify_disable,
  depr_notify_enable = depr_notify_enable,
  blur = blur,
  startup_cmd = startup_cmd,
  open_nvim_tree = open_nvim_tree
}
