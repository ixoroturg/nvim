package.path = package.path .. ";/home/ixoroturg/.config/nvim/?.lua;/home/ixoroturg/.config/nvim/?/init.lua"
-- vim.opt.verbose = 20
-- print(vim.inspect(vim.notify))
-- vim.g.lazydev_enabled = true

-- require("autocommand/lsp").setup()
-- require("lsp/java")
require("lsp/config")
-- require("lsp/lua")

require("autocommand/usercommand")
require("settings/options") -- стандартные опции
-- vim.opt.verbose = 20
require("lazy-vim")
require("keymap/keymap")
require("themes/ixoroturg")
-- require("lazydev").setup()
local themes = require("themes");
vim.api.nvim_set_hl_ns(themes.default)



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
