package.path = package.path .. ";/home/ixoroturg/.config/nvim/?.lua;/home/ixoroturg/.config/nvim/?/init.lua;./?.lua"
-- vim.opt.verbose = 20
-- print(vim.inspect(vim.notify))
-- vim.g.lazydev_enabled = true
require("startup")
-- local h= "Что-то на русском"
-- require("lsp/java")
-- require("lsp/lua")

require("autocommand/lsp")
require("lsp/config")
require("autocommand/usercommand")
require("settings/options") -- стандартные опции
require("autocommand/after-options")

-- vim.opt.verbose = 20
require("keymap/keymap")
-- require("lazydev").setup()
local themes = require("themes");
vim.api.nvim_set_hl_ns(themes.default)

require("themes/ixoroturg")




-- vim.cmd.colorscheme("red_theme")

-- require("lazydev").setup({
-- 	debug = true,
-- 	library = {
-- 		"nvim-cmp/lua/cmp/types"
-- 	}
-- })

-- -- original_notify = vim.notify
-- print(original_notify)
-- local ntf = function(msg,level,opts)
-- 	local title
-- 	-- print("level", vim.log.levels.INFO)
-- 	-- print("level 2", level)
-- 	if level == vim.log.levels.INFO then
-- 		title = "Уведомление"
-- 	end
-- 	opts.title = title
-- 	-- print(vim.inspect(opts))
-- 	original_notify(msg,level,opts)
-- end
-- vim.notify = ntf
-- print(1, vim.notify)
-- vim.defer_fn(function()
-- 	print(2, vim.notify)
-- 	vim.notify = ntf
-- 	print(3, vim.notify)
-- 	vim.notify("Работай",2,{title = "тварь"})
-- end, 5000)
