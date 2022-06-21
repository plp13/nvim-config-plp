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
  -- Scroll popup contents up and down using C-j and C-k
  popup_mappings = {
    scroll_down = '<c-k>',
    scroll_up = '<c-j>',
  },
  -- Look
  layout = {
    height = { min = 2, max = 40 },
    width = { min = 20, max = 70 },
  },
  window = {
    border = "single",
  },
}

-- KEY MAPPINGS

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Key mappings for *all* modes

-- M-/: launch :WhichKey to get help
-- M-n: new buffer (File/New)
-- M-s: save buffer (File/Save)
-- M-w: delete buffer (File/Close)
-- M-C: clear search highlights
for _, m in pairs({ "n", "v", "i", "x", "c", "o", "s", "t" }) do
wk.register({
  ["<M-/>"] = { "<cmd>WhichKey<cr>", "Show all keyboard shortcuts" },
  ["<M-n>"] = { "<cmd>enew<cr>", "New empty buffer" },
  ["<M-s>"] = { "<cmd>write<cr>", "Save buffer" },
  ["<M-w>"] = { "<cmd>Bdelete<cr>", "Delete buffer" },
  ["<M-c>"] = { "<cmd>nohlsearch<cr>", "Clear search highlights" },
  -- The following entries concern fixes and tidying up
  ["Y"] = "Yank line",  -- fix missing which-key entry
}, { mode = m })
end

-- Key mappings for *normal* mode

-- Navigate through windows using C-<arrow key> (as well as C-w followed by h, j, k, or l)
wk.register({
  ["<C-Up>"] = { "<C-w>k", "Go to the up window" },
  ["<C-Down>"] = { "<C-w>j", "Go to the down window" },
  ["<C-Left>"] = { "<C-w>h", "Go to the left window" },
  ["<C-Right>"] = { "<C-w>l", "Go to the right window" },
}, { mode = "n" })

-- Resize current window using M-<arrow key>
wk.register({
  ["<M-Up>"] = { "<cmd>resize +2<cr>", "Make window taller" },
  ["<M-Down>"] = { "<cmd><resize -2<cr>", "Make window shorter" },
  ["<M-Left>"] = { "<cmd>vertical resize +2<cr>", "Make window wider" },
  ["<M-Right>"] = { "<cmd>vertical resize -2<cr>", "Make window narrower" },
}, { mode = "n" })

-- Navigate buffers using S-<left arrow> or S-<right arrow>
wk.register({
  ["<S-Right>"] = { "<cmd>bnext<cr>", "Next buffer" },
  ["<S-Left>"] = { "<cmd>bprevious<cr>", "Previous buffer" },
}, { mode = "n" })

-- Move current line up using M-k and down using M-j
wk.register({
  ["<M-k>"] = { "<esc><cmd>move .-2<cr>", "Move text up" },
  ["<M-j>"] = { "<esc><cmd>move .+1<cr>", "Move text down" },
}, { mode = "n" })

-- Open various terminals using <Leader>-*
wk.register({
  ["<Leader>t"] = "Open a terminal",
  ["<Leader>tt"] = { "<cmd>split term://$SHELL<cr>", "Open a shell terminal" },
  ["<Leader>tl"] = { "<cmd>split term://lua<cr>", "Open a Lua terminal" },
  ["<Leader>tn"] = { "<cmd>split term://node<cr>", "Open a Node.js terminal" },
  ["<Leader>tp"] = { "<cmd>split term://python<cr>", "Open a Python terminal" },
  ["<Leader>ti"] = { "<cmd>split term://ipython<cr>", "Open an iPython terminal" },
  ["<Leader>ty"] = { "<cmd>split term://pypy<cr>", "Open an PyPy terminal" },
}, { mode = "n" })

-- Key mappings for *insert* mode

-- Nothing here yet

-- Key mappings for *visual* mode

-- Indent selected text using > or <
wk.register({
  ["<"] = { "<gv", "Indent selection left" },
  [">"] = { ">gv", "Un-indent selection right" },
}, { mode = "v" })

-- Move selected text up using M-k, or down using M-j
wk.register({
  ["<M-k>"] = { "<cmd>move .-2<cr>==", "Move text up" },
  ["<M-j>"] = { "<cmd>move .+1<cr>==", "Move text down" },
}, { mode = "v" })

-- When selecting text and then pasting over it, don't replace the clipboard contents with the selection
keymap("v", "p", '"_dP', opts)
wk.register({
  ["p"] = "Paste",
}, { mode = "v" })

-- Key mappings for *visual block* mode

-- Move selected text down using A-j, or up using A-k
wk.register({
  ["<M-k>"] = { ":move '<-2<cr>gv-gv", "Move text up" },
  ["<M-j>"] = { ":move '>+1<cr>gv-gv", "Move text down" },
}, { mode = "v" })
