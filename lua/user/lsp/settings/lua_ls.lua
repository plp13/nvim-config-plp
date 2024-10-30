-- Custom options for lua_ls LSP server (LUA)

return {
  settings = {
    -- Add support for NeoVim API
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
