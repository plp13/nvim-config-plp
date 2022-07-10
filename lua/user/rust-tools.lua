-- Custom options for rust-tools.nvim: advanced LSP client for Rust

-- Require rust-tools (exit if it's not installed)
local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
  return
end

rust_tools.setup {
  tools = {
    -- Enable and configure type hints
    autoSetHints = true,
    inlay_hints = {
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      highlight = "MoonflyGrey236",
    },
  },
  server = {
    -- The following two lines are required because rust-tools overrides LSP's default configuration
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  },
}

-- Which-key mappings for rust-tools.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  wk.register({
    ["<Leader>lr"] = { "<cmd>RustRun<cr>", "Run program" },
  }, { mode = "n" })
end
