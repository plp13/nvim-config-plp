-- Custom options for pyright LSP server (Python)

return {
	settings = {
      python = {
        analysis = {
          -- Disable type checking (doesn't work properly)
          typeCheckingMode = "off",
        },
      },
	},
}
