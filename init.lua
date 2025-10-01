-- Master configuration file for NeoVim

-- Disable all notifications that contain "deprecated"
-- Comment out the following two lines after updating, to check if there are any
-- new deprecation notifications
local utils = require "user.utils"
utils.depr_notify_disable()

-- General options and plugins
require "user.options"
require "user.plugins"

-- User interface
require "user.ui"
require "user.neovide"
require "user.popui"

-- Startup
require "user.startup"

-- Help
require "user.which_key"

-- Status line and buffer line
require "user.lualine"
require "user.bufferline"

-- Syntax highlighting
require "user.treesitter"
require "user.indent-blankline"

-- Language Server Protocol (LSP)
require "user.lsp"
require "user.rust-tools"

-- Debug Adapter Protocol (DAP)
require "user.dap"

-- Auto-completion
require "user.coq"

-- Editing utilities
require "user.autopairs"
require "user.comment"

-- File management
require "user.nvim-tree"

-- Searching
require "user.telescope"

-- Git
require "user.gitsigns"

-- Re-enable all notifications that contain "deprecated"
utils.depr_notify_enable()
