local hl = vim.api.nvim_set_hl
local ns = 0
local open = "#00ff00"
local close = "#bbbb00"

hl(ns, "TabActive", {bg = open,fg = "black", bold = true})
hl(ns, "TabActiveEnd", {fg = open, bg = NormalBg})
hl(ns, "TabActiveStart", {bg = open, fg = NormalBg})

hl(ns, "TabInactive", {bg = close,fg = "black", bold = true})
hl(ns, "TabInactiveEnd", {fg = close, bg = NormalBg})
hl(ns, "TabInactiveStart", {fg = NormalBg, bg = close})



function createCustomTabLine()
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()
	-- print("tabs count: " .. #tabs .. ", current: " .. current)
	local s = ""
	for i, tab in ipairs(tabs) do
		-- print(i.." "..tab)
		local tabName = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))), ":t")
		if tabName == nil or tabName == "" then
			tabName = "пусто"
		end
		if tab == current then
			tabName = "%#TabActiveStart#%#TabActive# " .. tabName .. " %#TabActiveEnd#"
		else
			tabName = "%#TabInactiveStart#%#TabInactive# " .. tabName .. " %#TabInactiveEnd#"
		end
		s = s .. "%"..i.."T" .. tabName .. "%" .. i .."T"
	end
	return "%#Normal#"..s .. "%#Normal#"
end

vim.opt.tabline = "%!v:lua.createCustomTabLine()"
