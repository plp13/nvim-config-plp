-- Configuration for nvim-autopairs: automatically close parentheses, strings, etc.

-- Require nvim-autopairs (exit if it's not installed)
local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

nvim_autopairs.setup {
  -- Disable certain operations and/or languages
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  -- Disable certain filetypes
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  -- When there's ambiguity, choose where to put the closing parenthesis by pressing M-e
  fast_wrap = {},
}

