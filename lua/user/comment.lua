-- Configuration for Comment.nvim: comment out lines and blocks easily

-- Key mappings: gcc comments line, gc comments block

-- Require Comment (exit if it's not installed)
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {}
