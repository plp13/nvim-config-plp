-- Configuration for nvim-tree.lua: a file manager

-- Require nvim-tree (exit if it's not installed)
local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- Automatically close the tree when qutting a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

tree.setup {
  -- Disable and hijack netrw (NeoVim's built-in file manager)
  disable_netrw = true,
  hijack_netrw = true,
  -- Automatically open the tree on startup
  open_on_setup = true,
  open_on_setup_file = true,
  -- Keep cursor on the first letter of the filename
  hijack_cursor = true,
  -- Whenever CWD is changed, refresh the tree
  update_cwd = true,
  -- Mark files that have LSP diagnostics
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  -- Upon opening the tree, find the file being edited and place the cursor over it
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  -- Filtering options
  filters = {
    -- Don't show dotfiles
    dotfiles = false,
    custom = {},
  },
  -- Show Git signs of files
  git = {
    enable = true,
    -- Honour .gitignore
    ignore = true,
    -- Kill the git process if it takes more than 400ms to run
    timeout = 400,
  },
  -- Icons
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
}

-- Which-key mappings and annotations
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then

  -- Map <Leader>e to toggle the tree from any buffer
  wk.register({
    ["<Leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle file manager" },
  }, { mode = "n" })

  -- Hijack nvim-tree.actions.apply_mappings() to create which-key annotations for all key mappings
  -- The annotations are automatically retrieved from table nvim-tree.actions.mappings
  local tree_actions = require("nvim-tree.actions")
  tree_actions.apply_mappings_orig = tree_actions.apply_mappings
  function tree_actions.apply_mappings(bufnr)
    tree_actions.apply_mappings_orig(bufnr)
    for _, mapping in pairs(tree_actions.mappings) do
      local key = mapping.key
      local desc = mapping.desc
      if type(key) == "table" then
        for _, subkey in pairs(key) do
          wk.register({
            [subkey] = desc:gsub("^%l", string.upper)
          }, { mode = "n", buffer = bufnr })
        end
      else
        wk.register({
          [key] = desc:gsub("^%l", string.upper)
        }, { mode = "n", buffer = bufnr })
      end
    end
  end
end
