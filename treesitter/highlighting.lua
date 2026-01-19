local M = {}
local hl = vim.api.nvim_set_hl;
function createHl(ns)
	hl(ns, "Statement", { fg = "#ff00aa",bold = true})
	hl(ns,"Type", {fg = "#00bb55", bold = true})
	hl(ns,"Special",{fg = "#aa00cc"})
	hl(ns,"Function", {fg = "#00ffff", bold = true} )
	hl(ns,"@variable", {fg = "#ffff00"} )
	hl(ns,"Constant", {fg = "#ff2222", italic = true, bold = true} )
	hl(ns,"String", {fg = "#aaffaa"} )
	hl(ns,"PreProc",{fg = "#aaaaaa", italic = true})
end


M.setup = function()
	local ns = 0
	local ft = vim.bo.ft;
	createHl(ns)
	if ft == "java" then
		hl(ns,"@type.builtin",{fg = "#00bb55", bold = false})
		-- hl(ns,"@variable",{bg = "red", italic = false, bold = false})
		hl(ns,"@variable.member",{italic = false, bold = true})
		hl(0,"@character.java",{fg = "#88aadd"})
	end
	if ft == "lua" then
		hl(ns,"@constructor.lua",{})
	end
		
end

return M;
