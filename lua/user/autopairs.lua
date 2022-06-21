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

-- Integrate with cmp
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
