-- Plugins (and packer.nvim, the plugin manager)

local fn = vim.fn

-- Automatically install packer upon first startup
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "IMPORTANT: please restart NeoVim once installation is complete"
  print "Installing packer..."
  vim.cmd [[packadd packer.nvim]]
end

-- Synchronize packer whenever plugins.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Require packer (exit if it's not installed)
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Required plugins
  use "wbthomason/packer.nvim"                          -- packer
  use "nvim-lua/popup.nvim"                             -- popup API (req. by multiple plugins)
  use "nvim-lua/plenary.nvim"                           -- useful lua functions (req. by multiple plugins)
  use "RRethy/vim-illuminate"                           -- illuminate text in buffer
  use "kyazdani42/nvim-web-devicons"                    -- colourful icons library
  use "moll/vim-bbye"                                   -- provides :Bdelete, which closes current buffer without exiting NeoVim, even when there are no more buffers
  -- Startup
  use "startup-nvim/startup.nvim"                       -- startup screen
  -- Help
  use "folke/which-key.nvim"                            -- live cheat sheets
  -- Status line and buffer line
  use "nvim-lualine/lualine.nvim"                       -- an enhanced status line
  use "akinsho/bufferline.nvim"                         -- an enhanced buffer line
  -- Completions and snippets
  use "L3MON4D3/LuaSnip"                                -- snippet engine
  use "rafamadriz/friendly-snippets"                    -- collection of snippets
  use "hrsh7th/nvim-cmp"                                -- completion engine
  use "hrsh7th/cmp-buffer"                              -- buffer completions
  use "hrsh7th/cmp-path"                                -- path completions
  use "hrsh7th/cmp-cmdline"                             -- command line completions
  use "saadparwaiz1/cmp_luasnip"                        -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"                            -- LSP completions
  use "hrsh7th/cmp-nvim-lua"                            -- completions for the NeoVim Lua API
  -- Syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",                  -- better syntax highlighting and indentation
    run=":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"                            -- rainbow parentheses
  use "JoosepAlviste/nvim-ts-context-commentstring"     -- context-specific comments support (ie // vs /* */)
  use "lukas-reineke/indent-blankline.nvim"             -- indentation blankline
   -- Language Server Protocol (LSP)
  use "neovim/nvim-lspconfig"                           -- LSP base configuration
  use "williamboman/nvim-lsp-installer"                 -- LSP server manager
  -- Editing utilities
  use "windwp/nvim-autopairs"                           -- automatically close parentheses, strings, etc.
  use "numToStr/Comment.nvim"                           -- comment out lines and blocks easily
  -- File management
  use "kyazdani42/nvim-tree.lua"                        -- a file manager
  -- Searching
  use "nvim-telescope/telescope.nvim"                   -- a utility for finding stuff quickly
  use "nvim-telescope/telescope-fzf-native.nvim"        -- native sorter for Telescope
 -- Git
  use "lewis6991/gitsigns.nvim"                         -- integration with Git
  -- Color schemes
  use "bluz71/vim-moonfly-colors"                       -- moonfly

  -- Synchronize packer after cloning packer.nvim
  -- IMPORTANT: this code must be located at the very end of this function
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
