-- Language Server Protocol: configuration entrypoint

-- Require mason (exit if it's not installed)
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
