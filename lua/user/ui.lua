-- User interface look and feel

-- Configuration parameters
local colorscheme = "moonfly"    -- Colour scheme
local cursorline_hack = true     -- Change the cursorline highlight colours, to make it more subtle (may or may not be necessary, depending on your theme)
local cursorline_fg = "#80a0ff"  -- Highlighted cursor line foreground
local cursorline_bg = "#080808"  -- Highlighted cursor line background

-- Set the colour scheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Unable to set the colour scheme")
end

-- A quick hack to make cursorline highlighting more subtle
if cursorline_hack then
  vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_bg })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = cursorline_fg, bg = cursorline_bg })
end
