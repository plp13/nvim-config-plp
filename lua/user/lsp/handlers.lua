-- Language Server Protocol: handler functions common for all LSP servers
-- LSP - handlers common to all LSP servers

-- Handlers object to be returned
local M = {}

-- LSP server set up function
M.setup = function()
  -- Diagnostic signs (ie icons)
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
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
    wk.register({
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "LSP: jump to declaration" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "LSP: jump to definition" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP: view information" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "LSP: view implementation" },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: view show signature info" },
    ["<Leader>n"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP: rename all references" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "LSP: view all references to what's under the cursor" },
    ["<Leader>a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP: perform code action" },
    ["<Leader>l"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "LSP: view all LSP diagnostics" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev({ border = \"rounded\" })<cr>", "LSP: previous diagnostic" },
    ["gl"] = { "<cmd>lua vim.diagnostic.open_float({ border = \"rounded\" })<cr>", "LSP: show diagnostic information in window" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next({ border = \"rounded\" })<cr>", "LSP: next diagnostic" },
    ["<Leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "LSP: manage LSP diagnostics" },
    }, { mode = "n", buffer = bufnr })
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

-- Client capabilities available to an LSP server
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
