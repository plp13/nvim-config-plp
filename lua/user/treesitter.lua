-- Configuration for nvim-treesitter: better syntax highlighting and indentation

-- Require nvim-treesitter (exit if it's not installed)
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- Language parsers management
  ensure_installed = "all",                     -- languages to install: either "all", or a list of languages
  sync_install = false,                         -- install parsers synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" },                -- languages to not install
  -- Integrate with autopairs
  autopairs = {
    enable = true,
  },
  -- Integrate with Comment
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- Syntax highlighting
  highlight = {
    enable = true,                              -- false will disable the whole extension
    disable = { "" },                           -- languages for which highlighting will be disabled
    additional_vim_regex_highlighting = false,  -- disable syntax highlighting using old-style Vim rules
  },
  -- Automatic indentation
  indent = {
    enable = true,                              -- false will disable indentation for all languages
    disable = { "" },                           -- languages for which indentation will be disabled
  },
  -- Rainbow parentheses
  rainbow = {
    enable = true,                              -- false will disable the whole extension
    -- disable = { "jsx", "cpp" }               -- language for which rainbow parentheses will be disabled
    extended_mode = true,                       -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,                       -- do not enable the extension for files with more than n lines (nil enables it for all files)
    -- colors = {},                             -- parentheses colours (a table of hex strings)
    -- termcolors = {},                         -- parentheses colours (a table of colour name strings)
  },
}
