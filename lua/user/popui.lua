-- Configuration for popui.nvim: a popup window for vim.ui.select and vim.ui.input actions

-- Require popui (exit if it's not installed)
local status_ok, _ = pcall(require, "popui.ui-overrider")
if not status_ok then
  return
end

-- Override vim.ui.select and vim.ui.input
vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")

-- Use rounded border
vim.g.popui_border_style = "rounded"
