-- Configuration for bufferline.nvim: an enhanced buffer line

-- Require bufferline (exit if it's not installed)
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    -- Use a thin separator
    separator_style = "thin", -- buffer separator style - "slant" | "thick" | "thin" | { 'any', 'any' },
    -- Make all tabs the same length
    enforce_regular_tabs = true,
    -- Do not show the tab close icon
    show_close_icon = false,
    -- Commands to execute when clicking on buttons; crucially use :Bdelete to close buffers
    close_command = "Bdelete! %d", -- command to execute when clicking a tab's close icon - string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- command to execute when right clicking a buffer - string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- command to execute when left clicking a buffer - string | function, see "Mouse actions"
    middle_mouse_command = nil, -- command to execute when middle clicking a buffer - string | function, see "Mouse actions"
    -- Icons
    indicator = { icon = "▎" }, -- icon indicating active buffer
    buffer_close_icon = "", -- the close buffer icon
    modified_icon = "◴", -- icon indicating a modified buffer
    close_icon = "", -- the close tab icon
    left_trunc_marker = "«", -- more buffers to the left icon
    right_trunc_marker = "»", -- more buffers to the right icon
    -- Button size
    max_name_length = 30, -- maximum buffer name length
    max_prefix_length = 30, -- maximum prefix length (used when a buffer is de-duplicated)
    tab_size = 21,
    -- Do not show the buffers over Nvim-Tree
    offsets = {
      {
        filetype = "NvimTree",
        text = "Files",
        uhighlight = "Directory",
        text_align = "left",
        padding = 1,
      },
    },
  },
  -- Colours
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    buffer_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    buffer_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" }
    },
    tab_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    duplicate_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "TabLineSel" },
      italic = true,
    },
    duplicate_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      italic = true,
    },
    duplicate = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      italic = true,
    },
    modified = {
      fg = { attribute = "fg", highlight = "Error" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      fg = { attribute = "fg", highlight = "Error" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      fg = { attribute = "fg", highlight = "Error" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    separator = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator_visible = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
  },
}

-- Which-key mappings for bufferline.nvim
local wk_status_ok, wk = pcall(require, "which-key")
if wk_status_ok then
  -- Navigate buffers using S-<left arrow> or S-<right arrow>
  wk.add({
    { "<S-Right>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-Left>",  "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    { mode = "n" }, })

  -- Move (reorder) the current buffer using C-S-<down arrow> or S-<up arrow>
  wk.add({
    { "<S-Down>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer to the right" },
    { "<S-Up>",   "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer to the left" },
    { mode = "n" }, })
end
