-- Configuration for coq_nvim: a very fast auto-completer

-- Require coq (exit if it's not installed)
local status_ok, coq = pcall(require, "coq")
if not status_ok then
  return
end

-- Require which-key (exit if it's not installed)
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

vim.g.coq_settings = {
  completion = {
    always = false, -- only bring up popup menu with CTRL-=
  },
  keymap = {
    recommended = false, -- we'll set up our own keymap
  },
  display = {
    ghost_text = {
      enabled = false, -- disable ghost text
    },
    icons = {
      mode = "short",             -- icons w/o text
    },
    pum = {                       -- popup menu window:
      x_max_len = 30,             -- at most 30 characters wide
      y_ratio = 0.4,              -- at most 40% of parent window tall
      kind_context = { " ", "" }, -- do not decorate kind icon
      source_context = { " ", "" }, -- di not decorate source text
    },
    preview = {                   -- preview window:
      x_max_len = 40,             -- at most 40 characters wide
      border = {                  -- disable border
        { "",  "NormalFloat" },
        { "",  "NormalFloat" },
        { "",  "NormalFloat" },
        { " ", "NormalFloat" },
        { "",  "NormalFloat" },
        { "",  "NormalFloat" },
        { "",  "NormalFloat" },
        { " ", "NormalFloat" }
      },
      positions = { -- place on the right if possible
        east = 1,
        west = 2,
        south = 3,
        north = 4,
      },
    },
  },
}

-- Compile all snippets
vim.cmd("COQsnips compile")

-- Define our keymap
vim.cmd("inoremap <silent><expr> <Esc>   pumvisible() ? '<C-e><Esc>' : '<Esc>'")
vim.cmd("inoremap <silent><expr> <C-c>   pumvisible() ? '<C-e><C-c>' : '<C-c>'")
vim.cmd("inoremap <silent><expr> <BS>    pumvisible() ? '<C-e><BS>' : '<BS>'")
vim.cmd(
"inoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? '<C-e><CR>' : '<C-y>') : '<CR>'")

-- Go!
vim.cmd("COQnow -s")

-- Hide which-key help strings for unused mappings
wk.add({
  { "<c-h>",       hidden = true },
  { mode = "nivot" }, })
