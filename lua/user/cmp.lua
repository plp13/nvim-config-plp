-- Configuration for nvim-cmp, et al: completions and snippets

-- Require cmp (exit if it's not installed)
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- Require luasnip (exit if it's not installed)
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Helper of cmp.setup()
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Completion kind icons
-- Find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "μ",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  -- Use luasnip as the snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- Keyboard mappings
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),                         -- C-k jumps to previous completion menu item
    ["<C-j>"] = cmp.mapping.select_next_item(),                         -- C-j jumps to next item
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }), -- C-b scrolls the docs window up
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),  -- C-f scrolls it down
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),  -- C-<Space> brings up the completion menu
    ["<C-y>"] = cmp.config.disable,                                     -- C-y is disabled
    ["<C-e>"] = cmp.mapping {                                           -- C-e closes the completion menu
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },                   -- <CR> selects the currently selected item
    ["<Tab>"] = cmp.mapping(function(fallback)                          -- <Tab> works as a super tab
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)                        -- <S-Tab> as well
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  -- Completion menu looks
  formatting = {
    -- Menu fields
    fields = {
      "kind", -- kind icon
      "abbr", -- abbreviation
      "menu", -- menu source
    },
    -- Menu item formatting function
    format = function(entry, vim_item)
      -- Insert the appropriate kind icon into vim_item.kind
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- Insert the appropriate source label into vim_item.menu
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NeoVim Lua]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      -- Return vim_item
      return vim_item
    end,
  },
  -- Completion sources (in order of presidence)
  sources = {
    { name = "nvim_lsp" },  -- LSP
    { name = "nvim_lua" },  -- NeoVim Lua API
    { name = "luasnip" },   -- snippets
    { name = "buffer" },    -- stuff in current buffer
    { name = "path" },      -- file paths
  },
  -- Confirmation options
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- Window looks
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  -- Disable all experimental features
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
