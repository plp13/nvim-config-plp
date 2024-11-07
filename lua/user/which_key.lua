-- Configuration for which-key.nvim: live cheat sheets
-- Also includes all key mappings that aren't plugin-specific

-- Require which-key (exit if it's not installed)
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {
  -- Enable spelling suggestions
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 36
    },
  },
  -- Look
  layout = {
    height = { min = 2, max = 40 },
    width = { min = 20, max = 70 },
  },
  win = {
    border = "rounded",
  },
  icons = {
    mappings = false
  }
}

-- KEY MAPPINGS

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Which-key has some issues mapping for all modes; we'll be using this function instead
local mapall = function(key, op)
  vim.cmd(":nmap " .. key .. " " .. op)
  vim.cmd(":imap " .. key .. " " .. op)
  vim.cmd(":vmap " .. key .. " " .. op)
  vim.cmd(":omap " .. key .. " " .. op)
  vim.cmd(":tmap " .. key .. " " .. op)
end

-- Key mappings for *all* modes

-- M-/: launch :WhichKey to get help
-- C-n: new buffer (File/New)
-- C-s: save buffer (File/Save)
-- C-w: delete buffer (File/Close)
-- C-c: clear search highlights
-- C-b: toggle (soft) line break
-- C-e: toggle highlighting spelling mistakes
wk.add({
  { "<M-/>",       desc = "Show all keyboard shortcuts" },
  { "<M-n>",       desc = "New empty buffer" },
  { "<M-s>",       desc = "Save buffer" },
  { "<M-w>",       desc = "Delete buffer" },
  { "<M-c>",       desc = "Clear search highlights" },
  { "<M-b>",       desc = "Toggle (soft) line break" },
  { "<C-e>",       desc = "Toggle highlighting spelling mistakes" },
  { mode = "nivot" }, })
mapall("<M-/>", "<cmd>WhichKey<cr>")
mapall("<M-n>", "<cmd>enew<cr>")
mapall("<M-s>", "<cmd>write<cr>")
mapall("<M-w>", "<cmd>Bdelete<cr>")
mapall("<M-c>", "<cmd>nohlsearch<cr>")
mapall("<M-b>", "<cmd>set wrap! linebreak<cr>")
mapall("<M-e>", "<cmd>set spell!<cr>")

-- Navigate through windows using C-<arrow key> (as well as C-w followed by h, j, k, or l)
wk.add({
  { "<C-Up>",      desc = "Go to the up window" },
  { "<C-Down>",    desc = "Go to the down window" },
  { "<C-Left>",    desc = "Go to the left window" },
  { "<C-Right>",   desc = "Go to the right window" },
  { mode = "nivot" }, })
mapall("<C-Up>", "<esc><C-w>k")
mapall("<C-Down>", "<esc><C-w>j")
mapall("<C-Left>", "<esc><C-w>h")
mapall("<C-Right>", "<esc><C-w>l")

-- Resize current window using M-<arrow key>
wk.add({
  { "<M-Up>",    desc = "Make window taller" },
  { "<M-Down>",  desc = "Make window shorter" },
  { "<M-Left>",  desc = "Make window wider" },
  { "<M-Right>", desc = "Make window narrower" },
  { mode = "nivot" }, })
mapall("<M-Up>", "<cmd>resize +2<cr>")
mapall("<M-Down>", "<cmd>resize -2<cr>")
mapall("<M-Left>", "<cmd>vertical resize +2<cr>")
mapall("<M-Right>", "<cmd>vertical resize -2<cr>")

-- Key mappings for *normal* mode

-- Move current line up using M-k and down using M-j
wk.add({
  { "<M-k>",   "<esc><cmd>move .-2<cr>", desc = "Move text up" },
  { "<M-j>",   "<esc><cmd>move .+1<cr>", desc = "Move text down" },
  { mode = "n" }, })

-- Open various terminals using <Leader>-*
wk.add({
  { "<Leader>t",  desc = "Open a terminal" },
  { "<Leader>tt", "<cmd>split term://$SHELL<cr>",  desc = "Open a shell terminal" },
  { "<Leader>tl", "<cmd>split term://lua<cr>",     desc = "Open a Lua terminal" },
  { "<Leader>tn", "<cmd>split term://node<cr>",    desc = "Open a Node.js terminal" },
  { "<Leader>tp", "<cmd>split term://python<cr>",  desc = "Open a Python terminal" },
  { "<Leader>ti", "<cmd>split term://ipython<cr>", desc = "Open an iPython terminal" },
  { "<Leader>ty", "<cmd>split term://pypy<cr>",    desc = "Open an PyPy terminal" },
  { mode = "n" }, })

-- Key mappings for *insert* mode

-- Nothing here yet

-- Key mappings for *visual* mode

-- Indent selected text using > or <
wk.add({
  { "<",       "<gv", desc = "Indent selection left" },
  { ">",       ">gv", desc = "Un-indent selection right" },
  { mode = "v" }, })
