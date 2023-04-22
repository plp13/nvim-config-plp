-- Custom options for pyright LSP server (Python)

return {
  settings = {
    python = {
      analysis = {
        -- Extra paths to be searched for Python modules; feel free to add to
        extraPaths = {
          "/home/plp/Documents/Development/Python/agroplan2",
          "/home/plp/Documents/Development/Python/mathplay/linalg"
        },
        -- Disable type checking (doesn't work properly)
        typeCheckingMode = "off",
      },
    },
  },
}
