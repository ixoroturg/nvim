package.path = package.path .. ";/home/ixoroturg/.config/nvim/?.lua;/home/ixoroturg/.config/nvim/?/init.lua"

require("settings/options") -- стандартные опции
require("lazy-vim")
local themes = require("themes");
vim.api.nvim_set_hl_ns(themes.default)
-- vim.cmd.colorscheme("red_theme")

