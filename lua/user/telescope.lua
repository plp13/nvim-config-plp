-- Configuration for telescope.nvim: a utility for finding stuff quickly

-- Require telescope (exit if it's not installed)
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    -- Icons
    prompt_prefix = " ",
    selection_caret = " ",
    -- Truncate paths intelligently
    path_display = { "smart" },
    mappings = {
      -- Key mappings for insert mode
      i = {
        ["<M-h>"] = "which_key",
      },
      -- Key mappings for normal mode
      n = {
        ["<M-h>"] = "which_key",
      },
    },
  },
}

-- Which-key mappings for telescope.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  wk.register({
    ["<Leader>f"] = {
      "<cmd>Telescope find_files prompt_title=Find\\ files\\ (simple) prompt_prefix=󰱽\\ <cr>",
      "Find files (simple)"
    },
    ["<Leader>g"] = {
      "<cmd>Telescope live_grep prompt_title=Find\\ files\\ (grep) prompt_prefix=󱁼\\ <cr>",
      "Find files (grep)"
    },
    ["<Leader>r"] = {
      "<cmd>Telescope oldfiles prompt_title=Open\\ a\\ recent\\ file prompt_prefix=󱋢\\ <cr>",
      "Open a recent file"
    },
    ["<Leader>s"] = {
      "<cmd>Telescope search_history prompt_title=Search\\ history prompt_prefix=󰋚\\ <cr>",
      "Search history"
    },
    ["<Leader>c"] = {
      "<cmd>Telescope command_history prompt_title=Command\\ history prompt_prefix=󰋚\\ <cr>",
      "Command history"
    },
    ["<Leader>b"] = {
      "<cmd>Telescope buffers prompt_title=Open\\ buffers prompt_prefix=󱇨\\ <cr>",
      "Open buffers"
    },
  }, { mode = "n" })
end
