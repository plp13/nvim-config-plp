-- Configuration for bufferline.nvim: an enhanced buffer line

-- Require bufferline (exit if it's not installed)
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    -- Use a thin separator
    separator_style = "thin",               -- buffer separator style - "slant" | "thick" | "thin" | { 'any', 'any' },
    -- Make all tabs the same length
    enforce_regular_tabs = true,
    -- Do not show the tab close icon
    show_close_icon = false,
    -- Commands to execute when clicking on buttons; crucially use :Bdelete to close buffers
    close_command = "Bdelete! %d",          -- command to execute when clicking a tab's close icon - string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d",    -- command to execute when right clicking a buffer - string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",       -- command to execute when left clicking a buffer - string | function, see "Mouse actions"
    middle_mouse_command = nil,             -- command to execute when middle clicking a buffer - string | function, see "Mouse actions"
    -- Icons
    indicator_icon = "▎",                   -- icon indicating active buffer
    buffer_close_icon = "",                -- the close buffer icon
    modified_icon = "",                    -- icon indicating a modified buffer
    close_icon = "",                       -- the close tab icon
    left_trunc_marker = "«",                -- more buffers to the left icon
    right_trunc_marker = "»",               -- more buffers to the right icon
    -- Button size
    max_name_length = 30,                   -- maximum buffer name length
    max_prefix_length = 30,                 -- maximum prefix length (used when a buffer is de-duplicated)
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
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    buffer_selected = {
      guifg = {attribute="fg",highlight="TabLineSel"},
      guibg = {attribute="bg",highlight="Normal"},
      gui = "none"
      },
    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_selected = {
      guifg = {attribute="fg",highlight="TabLineSel"},
      guibg ={attribute="bg",highlight="Normal"}
      },
    tab_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "TabLineSel" },
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    modified = {
      guifg = { attribute = "fg", highlight = "Error" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Error" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "Error" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    separator = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      guifg = { attribute = "bg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    separator_visible = {
      guifg = {attribute="bg",highlight="TabLine"},
      guibg = {attribute="bg",highlight="TabLine"}
      },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
