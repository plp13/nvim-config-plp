-- Configuration for lualine.nvim: an enhanced status line

-- Require lualine (exit if it's not installed)
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    -- Separators between components and sections
    component_separators = { left = "│", right = "│" },
    section_separators = { left = "█║", right = "║█" },
  },
  -- Extensions
  extensions = { "nvim-tree" }
}
