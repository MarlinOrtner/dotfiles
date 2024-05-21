return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Option 1: Set variables using Lua (Recommended/Cleaner)
      vim.g.gruvbox_material_background = "soft" -- 'hard', 'medium', 'soft'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_inlay_hints_background = "dimmed"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_sign_column_background = "none"

      -- Transparency (This replaces the 'transparent_ = 1' you tried later)
      vim.g.gruvbox_material_transparent_background = 2

      -- Set background and colorscheme
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  -- Configure LazyVim to load gruvbox as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
