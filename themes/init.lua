
local M = {}



M.default = vim.api.nvim_create_namespace("default_theme");
-- bg = 112240
vim.api.nvim_set_hl(M.default, "Normal", {bg = "#002742", fg = "#dddddd"})
NormalBg = "#002742"
vim.NormalFg = "#dddddd"
require("themes/tabline")
require("themes/statusline")
require("themes/lsp")
return M
