-- Configuration for the Neovide GUI front-end

-- Require neovide (exit if it's not installed)
local status_ok, _ = pcall(vim.api.nvim_get_var, "neovide")
if status_ok then
else
  return
end

-- Configuration parametres
local fullscreen = false            -- Always start in fullscreen mode
local font = "Hack Nerd Font Mono"  -- Font
local font_size = "h16"             -- Font size
local cursor_mode = "pixiedust"     -- Cursor effect mode

local gset = vim.api.nvim_set_var

-- Set fullscreen option
gset("neovide_fullscreen", fullscreen)

-- Set the GUI font and font size
vim.opt.guifont = font .. ":" .. font_size

-- Set the cursor effect mode
gset("neovide_cursor_vfx_mode", cursor_mode)

return
