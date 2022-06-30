-- Custom options for marksman LSP server (Markdown)

-- Custom options to be returned
local opts = {
  root_dir = function(fname)
    return vim.fn.getcwd()
  end,
}

return opts
