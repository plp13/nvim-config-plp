-- Custom options for rust-tools.nvim: advanced LSP client for Rust
-- Note: overrides NeoVim's default LSP client, and needs to be configured separately

-- Require rust-tools (exit if it's not installed)
local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
  return
end

-- Helper of on_attach(): configure additional which-key mappings for rust-tools.nvim
local function lsp_keymaps(bufnr)
  local wk_status_ok, wk = pcall(require, "which-key")
  if wk_status_ok then
    wk.register({
      ["<Leader>lr"] = { "<cmd>RustRunnables<cr>", "Run" },
      ["<Leader>ld"] = { "<cmd>RustDebuggables<cr>", "Debug" },
    }, { mode = "n", buffer = bufnr })
  end
end

-- Function that is called whenever a buffer with a Rust LSP server is attached
local function on_attach(client, bufnr)
  -- Call the on_attach() function in our standard LSP configuration
  local lsp_status_ok, lsp = pcall(require, "user.lsp.handlers")
  if lsp_status_ok then
    lsp.on_attach(client, bufnr)
  end
  -- Call lsp_keymaps()
  lsp_keymaps(bufnr)
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
  -- LSP server options: similar to the ones in our standard LSP configuration
  server = {
    -- Use the locally defined on_attach()
    on_attach = on_attach,
    -- Use the server capabilities defined in the standard configuration
    capabilities = require("user.lsp.handlers").capabilities,
  },
}
