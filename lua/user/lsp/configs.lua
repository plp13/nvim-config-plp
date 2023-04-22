-- Language Server Protocol: main configuration file

-- Require nvim-lsp-installer (exit if it's not installed)
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

-- LSP servers (languages) to configure
-- Feel free to add more
local servers = {
  "bashls",             -- Bash
  "clangd",             -- C/C++
  "dockerls",           -- Docker
  "jsonls",             -- JSON
  "eslint",             -- Javascript/Typescript
  "html",               -- HTML
  "marksman",           -- Markdown
  "pyright",            -- Python
  "rust_analyzer",      -- Rust
  "hls",                -- Haskell
  "sqlls",              -- SQL
  "lua_ls",             -- Lua
  "taplo",              -- TOML
  "yamlls",             -- YAML
}

-- Instruct nvim-lsp-installer to automatically install the aforementioned LSP servers
lsp_installer.setup {
  ensure_installed = servers
}

-- For each aforementioned LSP server...
for _, server in pairs(servers) do
  -- Initialize opts with a set of common options, defined in handlers
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  -- If current server has custom options (defined in settings.<server name>), extend opts to include them
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end

  -- Set the server up, using the setup function defined in handlers
  lspconfig[server].setup(opts)
end
