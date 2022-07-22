local present, tk_colors = pcall(require, "tokyonight.colors")
if not present then
  return
end

vim.cmd('colorscheme ' .. EcoVim.colorscheme)

-- Ecovim Colors
vim.highlight.create('EcovimPrimary', { guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondary', { guifg = "#FFA630" }, false);

vim.highlight.create('EcovimPrimaryBold', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimSecondaryBold', { gui = "bold", guifg = "#FFA630" }, false);

vim.highlight.create('EcovimHeader', { gui = "bold", guifg = "#488DFF" }, false);
vim.highlight.create('EcovimHeaderInfo', { gui = "bold", guifg = "#FFA630" }, false);
vim.highlight.create('EcovimFooter', { gui = "bold", guifg = "#FFA630" }, false);

if EcoVim.colorscheme == 'tokyonight' then
  local tokyonight_colors = tk_colors.setup({})

  -- Tokyonight config
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_colors = {
    border = '#1A1B26';
  }

  -- Lines
  vim.highlight.link('CursorLineNR', 'EcovimSecondary', true)
  vim.highlight.link('LineNr', 'Comment', true)

  -- Floats/Windows
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);

  -- Telescope
  vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);

  -- Diagnostics

  -- Misc
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('rainbowcol1', { guifg = tokyonight_colors.blue, ctermfg = 9 }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.link('BufferOffset', 'EcovimSecondary', true);

  -- Completion Menu Colors
  local highlights = {
    CmpItemAbbr            = { fg = tokyonight_colors.dark3, bg = "NONE" },
    CmpItemKindClass       = { fg = tokyonight_colors.orange             },
    CmpItemKindConstructor = { fg = tokyonight_colors.purple             },
    CmpItemKindFolder      = { fg = tokyonight_colors.blue2              },
    CmpItemKindFunction    = { fg = tokyonight_colors.blue               },
    CmpItemKindInterface   = { fg = tokyonight_colors.teal, bg = "NONE"  },
    CmpItemKindKeyword     = { fg = tokyonight_colors.magneta2           },
    CmpItemKindMethod      = { fg = tokyonight_colors.red                },
    CmpItemKindReference   = { fg = tokyonight_colors.red1               },
    CmpItemKindSnippet     = { fg = tokyonight_colors.dark3              },
    CmpItemKindVariable    = { fg = tokyonight_colors.cyan, bg = "NONE"  },
    CmpItemKindText        = { fg = "LightGrey"                          },
    CmpItemMenu            = { fg = "#C586C0", bg = "NONE"               },
    CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE"               },
    CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE"               },
  }

  vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokyonight_colors.blue0 })

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

if EcoVim.colorscheme == 'solarized' then
  -- Lines
  vim.highlight.link('CursorLineNR', 'EcovimSecondary', true)
  vim.highlight.link('LineNr', 'Comment', true)

  -- Floats/Windows
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);

  -- Telescope
  vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);

  -- Diagnostics

  -- Misc
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.link('BufferOffset', 'EcovimSecondary', true);
end

if EcoVim.colorscheme == 'catppuccin' then
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
  vim.cmd[[colorscheme catppuccin]]
  local catppuccin = require("catppuccin")
  catppuccin.setup({
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = false,
    term_colors = true,
    compile = {
      enabled = false,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      coc_nvim = false,
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      dap = {
        enabled = false,
        enable_ui = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = true,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
      mini = false,
    }
  })

  local catppuccin_colors = tk_colors.setup({})
  -- Completion Menu Colors
  local highlights = {
    CmpItemAbbr            = { fg = catppuccin_colors.dark3, bg = "NONE" },
    CmpItemKindClass       = { fg = catppuccin_colors.orange             },
    CmpItemKindConstructor = { fg = catppuccin_colors.purple             },
    CmpItemKindFolder      = { fg = catppuccin_colors.blue2              },
    CmpItemKindFunction    = { fg = catppuccin_colors.blue               },
    CmpItemKindInterface   = { fg = catppuccin_colors.teal, bg = "NONE"  },
    CmpItemKindKeyword     = { fg = catppuccin_colors.magneta2           },
    CmpItemKindMethod      = { fg = catppuccin_colors.red                },
    CmpItemKindReference   = { fg = catppuccin_colors.red1               },
    CmpItemKindSnippet     = { fg = catppuccin_colors.dark3              },
    CmpItemKindVariable    = { fg = catppuccin_colors.cyan, bg = "NONE"  },
    CmpItemKindText        = { fg = "LightGrey"                          },
    CmpItemMenu            = { fg = "#C586C0", bg = "NONE"               },
    CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE"               },
    CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE"               },
  }
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
  vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = catppuccin_colors.blue0 })
end

if EcoVim.colorscheme == 'gruvbox' then
  local g = vim.g
  g.gruvbox_material_palette = "mix"
  g.gruvbox_material_enable_italic = 1
  g.gruvbox_material_diagnostic_text_highlight = 1
  g.gruvbox_material_diagnostic_line_highlight = 1
  g.gruvbox_material_diagnostic_virtual_text = "colored"
  g.gruvbox_material_sign_column_background = "none"
  vim.cmd[[
    colorscheme gruvbox
  ]]
  local gruvbox_colors = tk_colors.setup({})
  -- Lines
  vim.highlight.link('CursorLineNR', 'EcovimSecondary', true)
  vim.highlight.link('LineNr', 'Comment', true)

  -- Floats/Windows
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);

  -- Telescope
  vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);

  -- Diagnostics

  -- Misc
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('rainbowcol1', { guifg = gruvbox_colors.blue, ctermfg = 9 }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.link('BufferOffset', 'EcovimSecondary', true);
end

if EcoVim.colorscheme == 'codedark' then
  vim.cmd[[
    let g:codedark_conservative = 1
    let g:codedark_italics = 1
    colorscheme codedark
  ]]
  local gruvbox_colors = tk_colors.setup({})

  -- Lines
  vim.highlight.link('CursorLineNR', 'EcovimSecondary', true)
  vim.highlight.link('LineNr', 'Comment', true)

  -- Floats/Windows
  vim.highlight.create('NormalFloat', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('FloatBorder', { guibg = "None" }, false);
  vim.highlight.create('WhichKeyFloat', { guibg = "None" }, false);
  vim.highlight.create('BufferTabpageFill', { guifg = "None" }, false);
  vim.highlight.create('VertSplit', { guibg = "#16161e", guifg = "#16161e" }, false);

  -- Telescope
  vim.highlight.link('TelescopeTitle', 'EcovimSecondary', true);
  vim.highlight.create('TelescopeNormal', { guibg = "None", guifg = "None" }, false);
  vim.highlight.create('TelescopeBorder', { guibg = "None" }, false);
  vim.highlight.link('TelescopeMatching', 'Constant', true);

  -- Diagnostics

  -- Misc
  vim.highlight.link('GitSignsCurrentLineBlame', 'Comment', true);
  vim.highlight.create('StatusLine', { guibg = "None" }, false);
  vim.highlight.create('StatusLineNC', { guibg = "None" }, false);
  vim.highlight.create('rainbowcol1', { guifg = gruvbox_colors.blue, ctermfg = 9 }, false);
  vim.highlight.create('Boolean', { guifg = "#F7768E" }, false);
  vim.highlight.link('BufferOffset', 'EcovimSecondary', true);
end
