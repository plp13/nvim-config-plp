-- Configuration for Comment.nvim: comment out lines and blocks easily

-- Key mappings: gcc comments line, gc comments block

-- Require Comment (exit if it's not installed)
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {}

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
