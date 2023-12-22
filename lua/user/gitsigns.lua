-- Configuration fog gitsigns.nvim: integration with Git

-- Require gitsigns (exit if it's not installed)
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  -- Signs icons
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
}

-- Which-key mappings for gitsigns.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  wk.register({
    ["]t"] = { ":Gitsigns next_hunk<cr>", "Git: next unstaged hunk" },
    ["[t"] = { ":Gitsigns prev_hunk<cr>", "Git: prev unstaged hunk" },
    ["tb"] = { ":Gitsigns blame_line<cr>", "Git: see blame" },
    ["tp"] = { ":Gitsigns preview_hunk<cr>", "Git: preview hunk" },
  }, { mode = "n" })
end
