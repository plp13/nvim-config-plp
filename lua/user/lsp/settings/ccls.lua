-- Custom options for ccls LSP server (C/C++)

return {
  settings = {
    index = {
      -- Use as many threads the CPU can support
      threads = 0,
      -- Do not parse comments
      comments = 0,
    },
  },
}
