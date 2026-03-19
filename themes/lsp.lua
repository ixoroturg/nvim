local hl = vim.api.nvim_set_hl
local ns = 0

local keywords = "#ff00ff"
local types = "#00cc00"
local interface = "#00ff00"
local local_variable = "#ffff00"
local variable = "#aaaa00"
local property = "#00eeff"
local charline = "#ff6600"
local stringline = "#aaffaa"
local literal = "#ff0000"
local method = "#ff88ff"
local annotation = "#aaaaaa"

hl(ns, "@lsp.type.namespace", {fg = property})
hl(ns, "@lsp.type.property", {fg = property})
hl(ns, "@lsp.type.parameter", {fg = variable})
hl(ns, "@lsp.typemod.property.readonly", {fg = property, italic = true, bold = true})
hl(ns, "@lsp.type.class", {fg = types})
-- hl(ns, "@lsp.typemod.class.readonly",{fg = types, bold = false, italic = false, force = true})
hl(ns, "@lsp.type.interface", {fg = interface, bold = true})
hl(ns, "javaType", {fg = keywords})
hl(ns, "Statement", {fg = keywords})
hl(ns, "@lsp.type.modifier", {fg = keywords})
hl(ns, "Constant", {fg = literal})
hl(ns, "@lsp.type.method", {fg = method})
hl(ns, "@lsp.type.variable", {fg = local_variable})
hl(ns, "@lsp.type.annotation", {fg = annotation})
hl(ns, "PreProc", {fg = annotation})
-- hl(ns, "@lsp", {fg = property, italic = true, bold = true})
hl(ns, "@type.builtin", {fg = interface})
hl(ns, "@variable.builtin", {fg = keywords})
hl(ns, "@constant.builtin", {fg = keywords})

hl(ns, "@character", {fg = charline})
hl(ns, "String", {fg = stringline})

