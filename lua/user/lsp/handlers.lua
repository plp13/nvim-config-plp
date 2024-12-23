-- Language Server Protocol: handler functions common for all LSP servers
-- LSP - handlers common to all LSP servers

-- Handlers object to be returned
local M = {}

-- LSP server set up function
M.setup = function()
  -- Diagnostic signs (ie icons)
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- Disable virtual text
    virtual_text = false,
    -- Enable diagnostic signs, as defined above
    signs = {
      active = signs,
    },
    -- Update diagnostics as you type
    update_in_insert = true,
    -- Enable underlining stuff
    underline = true,
    -- Sort diagnostics by severity
    severity_sort = true,
    -- Look for floating windows
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  -- Look for hover windows
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  -- Look for signature help windows
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- Helper of on_attach(): when placing the cursor over a keyword, illuminate all instances of said keyword in the document
local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-- Helper of on_attach(): configure which-key mappings for the server
local function lsp_keymaps(bufnr)
  local wk_status_ok, wk = pcall(require, "which-key")
  if wk_status_ok then
    wk.add({
      { "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>",                          desc = "LSP: jump to declaration" },
      { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",                           desc = "LSP: jump to definition" },
      { "K",          "<cmd>lua vim.lsp.buf.hover()<cr>",                                desc = "LSP: view information" },
      { "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>",                       desc = "LSP: view implementation" },
      { "<C-k>",      "<cmd>lua vim.lsp.buf.signature_help()<cr>",                       desc = "LSP: view show signature info" },
      { "gr",         "<cmd>lua vim.lsp.buf.references()<cr>",                           desc = "LSP: view all references to what's under the cursor" },
      { "<Leader>l",  desc = "Language Server Protocol (LSP)" },
      { "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>",                               desc = "Rename all references" },
      { "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                          desc = "Perform code action" },
      { "<Leader>ll", "<cmd>lua vim.diagnostic.open_float()<cr>",                        desc = "View all LSP diagnostics" },
      { "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",                        desc = "Manage LSP diagnostics" },
      { "<Leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true })<cr>",              desc = "Format code" },
      { "[d",         "<cmd>lua vim.diagnostic.goto_prev({ border = \"rounded\" })<cr>", desc = "LSP: previous diagnostic" },
      {
        "gl",
        "<cmd>lua vim.diagnostic.open_float({ border = \"rounded\" })<cr>",
        desc =
        "LSP: show diagnostic information in window"
      },
      { "]d",       "<cmd>lua vim.diagnostic.goto_next({ border = \"rounded\" })<cr>", desc = "LSP: next diagnostic" },
      { mode = "n", buffer = bufnr }, })
  end
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Function that is called whenever an LSP server is attached
M.on_attach = function(client, bufnr)
  -- vim.notify(client.name .. " starting...")
  -- TODO: refactor this into a method that checks if string in list

  -- If this server is for TypeScript, turn off document formatting
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  -- Call lsp_keymaps() and lsp_highlight_document()
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
