local hl = vim.api.nvim_set_hl
local ns = 0;

hl(ns,"CursorLineNr",{fg = "#ff8800", bold = true,italic = true})
hl(ns,"LineNr",{fg = "#888888"})

hl(ns,"NotifyBackground", {bg = "#aaffaa", fg = "#000000"})
hl(ns,"FloatBorder", {fg = "#ff0000"})
hl(ns,"NoiceCmdlinePopupBorder", {fg = "#ff00ff"})
hl(ns,"NoiceCmdlinePopup", {fg = "#00ffff"})

hl(ns,"BlinkCmpMenu",{bg = "#231324"})

hl(ns,"DiagnosticVirtualTextError",{bg = "#ff0000", fg = "#ffffff"})
hl(ns,"DiagnosticVirtualTextInfo",{fg = "#88bbcc"})
hl(ns,"DiagnosticVirtualTextWarn",{bg = "#444400", fg = "#bbbb00"})
hl(ns,"DiagnosticVirtualTextHint",{fg = "#999999"})
hl(ns,"DiagnosticVirtualTextOk",{fg = "#aaffaa"})

local cursorlines = "#003961"

hl(ns, "CursorColumn", {bg = cursorlines})
hl(ns, "CursorLine", {bg = cursorlines})

hl(ns, "InsertMode", {bg = "#00aa00"})
hl(ns, "NormalMode", {bg = "#aaaaaa"})
hl(ns, "OperatorPending", {bg = "#ff0000"})
hl(ns, "Yank", {bg = "#ff5500", fg = "black", bold = true})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "подсветка на копирование",
	callback = function ()
		vim.highlight.on_yank({higroup = "Yank",timeout = 200})
	end
})
