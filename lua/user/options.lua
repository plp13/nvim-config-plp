-- General options

local options = {
  backup = false,                           -- do not create a backup file
  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
  cmdheight = 1,                            -- set commandline height to 1 (the default)
  completeopt = { "menuone", "noselect" },  -- mostly just for cmp
  conceallevel = 0,                         -- so that `` is visible in markdown files
  fileencoding = "utf-8",                   -- the encoding written to a file
  hlsearch = true,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search patterns
  mouse = "a",                              -- allow the mouse to be used in neovim
  pumheight = 10,                           -- pop up menu height
  showmode = false,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                          -- always show tabs
  smartcase = true,                         -- smart case
  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  swapfile = false,                         -- creates a swapfile
  title = true,                             -- set term title to the filename of the current buffer
  termguicolors = true,                     -- set term gui colors (most terminals support this)
  winblend = 15,                            -- make popup windows transparent
  pumblend = 15,                            -- make popup menus transparent
  timeoutlen = 500,                         -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                          -- enable persistent undo
  updatetime = 300,                         -- faster completion (4000ms default)
  writebackup = false,                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- the number of spaces inserted for each indentation
  tabstop = 4,                              -- insert 4 spaces for a tab
  cursorline = true,                        -- highlight the cursor line
  number = true,                            -- set numbered lines
  relativenumber = false,                   -- set relative numbered lines
  numberwidth = 4,                          -- set number column width to 2 {default 4}
  signcolumn = "yes",                       -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                             -- display lines as one long line
  scrolloff = 8,                            -- vertical scrolling begins when cursor is 8 lines before window top/bottom
  sidescrolloff = 16,                       -- horizontal scrolling begins when cursor is 16 lines before window side
  colorcolumn = "80",                       -- show a vertical bar at column 80
  guifont = "monospace:h17",                -- the font used in graphical neovim applications
}

-- Apply all of the above options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Extra Vimscript commands
vim.cmd "set whichwrap+=<,>,[,],h,l"        -- when begining/end of line is reached while scrolling left/right, go to the previous/next line (resp.)
