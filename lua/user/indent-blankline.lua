-- Configuration for indent-blankline.nvim: indentation blankline

-- Require indent_blankline (exit if it's not installed)
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
  -- Use a dashed line
  char = "┊"
}
