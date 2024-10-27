-- Configuration for gitsigns.nvim: integration with Git

-- Require gitsigns (exit if it's not installed)
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  -- Signs icons
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "▎" },
    topdelete = { text = "▎" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
}

-- Which-key mappings for gitsigns.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  wk.add({
    { "]t",      ":Gitsigns next_hunk<cr>",    desc = "Git: next unstaged hunk" },
    { "[t",      ":Gitsigns prev_hunk<cr>",    desc = "Git: prev unstaged hunk" },
    { "tb",      ":Gitsigns blame_line<cr>",   desc = "Git: see blame" },
    { "tp",      ":Gitsigns preview_hunk<cr>", desc = "Git: preview hunk" },
    { mode = "n" }, })
end
