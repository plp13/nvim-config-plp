-- Configuration for Comment.nvim: comment out lines and blocks easily

-- Key mappings: gcc comments line, gc comments block

-- Require Comment (exit if it's not installed)
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  -- Integrate with Treesitter to create custom commentstrings for TypeScript
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == 'typescriptreact' then
      local U = require('Comment.utils')

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
}

-- Which-key annotations for Comment.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  wk.register({
    ["gcc"] = "Toggle comment",
    ["gc"] = "Toggle comment",
    ["gbc"] = "Toggle multi-line comment",
    ["gb"] = "Toggle multi-line comment",
  },
    { mode = "n" })
  wk.register({
    ["gc"] = "Toggle comment",
    ["gb"] = "Toggle multiline comment",
    ["ic"] = "Toggle comment",
  },
    { mode = "x" })
  wk.register({
    ["ic"] = "Toggle comment",
  },
    { mode = "o" })
end
