-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shortmess:append("I") -- Hide the startup screen
vim.opt.shortmess:append("A") -- Ignore swap file messages

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
