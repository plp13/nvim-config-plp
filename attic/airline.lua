-- Configuration for vim-airline: an enhanced status line (deprecated)

-- Exit if airline is not installed
local status_ok, _ = pcall(vim.api.nvim_get_var, "airline_theme")
if not status_ok then
  return
end

local gset = vim.api.nvim_set_var

-- Use powerline font symbols
gset("airline_powerline_fonts", true)

-- Enable the tabline
gset("airline#extensions#tabline#enabled", true)
