-- Custom options for yamlls LSP server (YAML)

-- Schemas to support
local schemas = {
  ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yaml",
}
-- Custom options to be returned
local opts = {
  settings = {
    yaml = {
      -- Use aforementioned schemas
      schemas = schemas
    },
  },
}

return opts
