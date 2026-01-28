local hl = vim.api.nvim_set_hl
local ns = 0;

hl(ns,"CursorLineNr",{fg = "#ff8800", bold = true,italic = true})
hl(ns,"LineNr",{fg = "#888888"})


hl(ns,"NotifyBackground", {bg = "#aaffaa", fg = "#000000"})
hl(ns,"FloatBorder", {fg = "#aa00aa"})
hl(ns,"NoiceCmdlinePopupBorder", {fg = "#ff00ff"})
hl(ns,"NoiceCmdlinePopup", {fg = "#00ffff"})



-- blink.cmp
hl(ns,"BlinkCmpMenu",{bg = "#231324"})

-- dsa

hl(ns,"DiagnosticVirtualTextError",{bg = "#ff0000", fg = "#ffffff"})
hl(ns,"DiagnosticVirtualTextInfo",{fg = "#88bbcc"})
hl(ns,"DiagnosticVirtualTextWarn",{bg = "#444400", fg = "#bbbb00"})
hl(ns,"DiagnosticVirtualTextHint",{fg = "#888888"})
hl(ns,"DiagnosticVirtualTextOk",{fg = "#aaffaa"})
