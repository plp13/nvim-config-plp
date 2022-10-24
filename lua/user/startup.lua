-- Configuration for startup.nvim: startup screen

-- Require startup (exit if it's not installed)
local status_ok, startup = pcall(require, "startup")
if not status_ok then
  return
end

startup.setup {
  header = {
    -- Header section: some ASCII art
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "             __..--''``---....___   _..._    __           ",
      "   /// //_.-'    .-/i\";  `        ``<._  ``.''_ `. / // /  ",
      "  ///_.-' _..--.'_    \\                    `( ) ) // //   ",
      "  / (_..-' // (< _     ;_..__               ; `' / ///    ",
      "   / // // //  `-._,_)' // / ``--...____..-' /// / //     ",
    },
    highlight = "SpecialKey",
    default_color = "",
    oldfiles_amount = 0,
  },
  body = {
    -- Body section: a common actions menu
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
      {
        " New File",
        "lua require(\"user/utils\").startup_cmd(nil)",
        "0",
      },
      {
        " Find files: simple",
        "lua require(\"user.utils\").startup_cmd(\"Telescope find_files prompt_title=Find\\\\ files\\\\ (simple) prompt_prefix=\\\\ \")",
        "1",
      },
      {
        " Find files: grep",
        "lua require(\"user.utils\").startup_cmd(\"Telescope live_grep prompt_title=Find\\\\ files\\\\ (grep) prompt_prefix=\\\\ \")",
        "2",
      },
      {
        " Open a recent file",
        "lua require(\"user.utils\").startup_cmd(\"Telescope oldfiles prompt_title=Open\\\\ a\\\\ recent\\\\ file prompt_prefix=\\\\ \")",
        "3",
      },
      {
        " Search history",
        "lua require(\"user.utils\").startup_cmd(\"Telescope search_history prompt_title=Search\\\\ history prompt_prefix=\\\\ \")",
        "4",
      },
      {
        "﬍ Command history",
        "lua require(\"user.utils\").startup_cmd(\"Telescope command_history prompt_title=Command\\\\ history prompt_prefix=﬍\\\\ \")",
        "5",
      },
    },
    highlight = "Directory",
    default_color = "",
    oldfiles_amount = 0,
  },
  footer = {
    -- Footer section: a bit extra help (and some vanity text)
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Footer",
    margin = 5,
    content = {
      "<space> = Leader  |  <space>e = Files  |  M-/ = Keyboard shortcuts",
      "",
      "nvim-config-plp",
    },
    highlight = "Number",
    default_color = "",
    oldfiles_amount = 0,
  },
  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = false,
    paddings = { 1, 3, 3, 0 },
  },
  parts = { "header", "body", "footer" },
}

-- Hijack startup.display() to hide the vertical line at 80 columns the first time it gets called
startup.display_orig = startup.display
startup.display_ft = true
function startup.display(force)
  startup.display_orig(force)
  if startup.display_ft then
    vim.opt_local["colorcolumn"] = ""
    startup.display_ft = false
  end
end

-- And then, hijack startup.remove_buffer() to reenstate it once startup.nvim goes away
startup.remove_buffer_orig = startup.remove_buffer
function startup.remove_buffer(info)
  vim.opt_local["colorcolumn"] = "80"
  startup.remove_buffer_orig(info)
end
