-- Configuration for indent-blankline.nvim: indentation blankline

-- Require indent_blankline (exit if it's not installed)
local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
  return
end

indent_blankline.setup {
  indent = {
    -- Use a dashed line
    char = "┆"
  },
  scope = {
    -- Do not underline start and end; it's annoying
    show_start = false,
    show_end = false
  }
}
