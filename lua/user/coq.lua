-- Configuration for coq_nvim: a very fast auto-completer

-- Require coq (exit if it's not installed)
local status_ok, coq = pcall(require, "coq")
if not status_ok then
  return
end


vim.g.coq_settings = {
  display = {
    ghost_text = {
      enabled = false,                  -- disable ghost text
    },
    icons = {
      mode = "short",                   -- icons w/o text
    },
    preview = {
      positions = {                     -- preferred positions of the preview window
        north = 1,
        south = 2,
        west = 3,
        east = 4,
      },
    },
  },
}

vim.cmd("COQsnips compile")
vim.cmd("COQnow -s")
