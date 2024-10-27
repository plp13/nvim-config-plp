-- Master configuration file for NeoVim

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
