return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background", -- Options: 'background', 'foreground', or 'virtual'
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_tailwind = true, -- Adds support for Tailwind CSS colors
    },
  },
}
