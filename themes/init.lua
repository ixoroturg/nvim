
local M = {}

M.default = vim.api.nvim_create_namespace("default_theme");

vim.api.nvim_set_hl(M.default, "Normal", {bg = "#112240", fg = "#dddddd"})

return M
