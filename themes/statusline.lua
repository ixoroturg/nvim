
local hl = vim.api.nvim_set_hl
local ns = 0
local filetype = "#00d0ff"
local mode = "#00ff00"
local fileName = "#bbbb00"
local gitBranch = "#ff4500"
local cursor = "white"
local lines = fileName
local command = cursor
local time = filetype
-- vim.api.nvim_get_mode().mode
local getModeName = function ()
	local modeName = vim.api.nvim_get_mode().mode;
	if modeName == "n" then modeName = "NORMAL" end
	if modeName == "v" then modeName = "VISUAL" end
	if modeName == "i" then modeName = "INSERT" end
	if modeName == "s" then modeName = "SELECT" end
	if modeName == "c" then modeName = "COMMAND" end
	if modeName == "no" then modeName = "OPERATOR" end
	return modeName
end
hl(ns, "FileType", {bg = filetype, fg = "black",bold = true})
hl(ns, "FileTypeEnd", {bg = mode, fg = filetype})
hl(ns, "Mode", {bg = mode, fg = "black", bold = true})
hl(ns, "ModeEnd", {bg = fileName, fg = mode})
hl(ns, "FileName", {bg = fileName, fg = "black", bold = true})
hl(ns, "FileNameEnd", {bg = gitBranch, fg = fileName})
hl(ns, "gitBranchName", {bg = gitBranch, fg = "black", bold = true})
hl(ns, "gitBranchNameEnd", {bg = cursor, fg = gitBranch})
hl(ns,"UnderCursor", {bg = cursor, fg = "black", bold = true})
hl(ns,"UnderCursorEnd", {bg = NormalBg, fg = cursor})
hl(ns,"Lines", {bg = lines, fg = "black", bold = true})
hl(ns,"LinesEnd", {bg = time, fg = lines})
hl(ns,"Time", {bg = time, fg = "black", bold = true})
hl(ns,"TimeEnd", {bg = command, fg = time})
hl(ns,"CommandLine", {bg = command, fg = "black", bold = true})
hl(ns,"CommandLineEnd", {bg = NormalBg, fg = command})

local gitBranchName = vim.fn.system("git branch --show-current 2>/dev/null")
gitBranchName = gitBranchName:sub(0,#gitBranchName -1)
	-- return name:sub(0,#name-1)
-- local getGitBranchName = function ()
-- 	return "master"
-- end
-- getGitBranchName()
local time = function ()
	local date = os.date("%X")
	return date
end

local timer = vim.loop.new_timer()
timer:start(0,1000 / 60,function ()
	vim.schedule(function ()
		vim.cmd("redrawstatus")
	end)
end)

StatusLineFunc = function ()
	return "%#FileType# %Y %#FileTypeEnd#%#Mode# ".. getModeName() .." %#ModeEnd#%#FileName#%(%-w %-a%) %-F%( %-h%-m%-r%) %#FileNameEnd# %#gitBranchName#" .. gitBranchName..  " %#gitBranchNameEnd#%#UnderCursor# 0x%-B %#UnderCursorEnd#%=%#CommandLineEnd#%#CommandLine# %S %#TimeEnd#%#Time# ".. time() .." %#LinesEnd#%#Lines# %(%l:%v/%L %p%%%) "
end


vim.opt.statusline = "%!v:lua.StatusLineFunc()"
