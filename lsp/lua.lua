
local lsp = vim.lsp
local ac = vim.api.nvim_create_autocmd

-- local M = {}

vim.lsp.config("lua", {
	root_markers = {"init.lua"},
	cmd = {"lua-language-server"},
	-- cmd = {"socat", "UNIX-CONNECT:/run/user/1000/lsp/lua.sock","STDIO"},
	-- cmd = {"socat","UNIX-CONNECT:/run/user/1000/lsp/lua.sock", "STDIO"},
	name = "lua",
	filetypes = {"lua"},
	settings = {
		-- https://luals.github.io/wiki/settings/
		Lua = {
			codeLens = {
				enabled = true
			},
			completion = {
				enable = true,
				callSnippet = "Replace",
				keyWordSnipped = true,
				autoRequire = true,
				postfix = "@",
				requireSeparator = "/",
				showWord = "Disable",
				-- workspaceWord = false,
			},
			diagnostics = {
				enable = true,
				disableScheme = {"git"},
				disable = {
					"different-requires",
					"newline-call",
					-- "name-style-check",
					"spell-check"
				},
				globals = {"vim"},
				libraryFiles = "Opened",
			},
			format = {
				enable = true
			},
			hint = {
				arrayIndex = "Auto",
				enable = true,
				setType = true
			},
			hover = {
				enable = true,
			},
			runtime = "LuaJIT",
			semantic = {
				enable = true,
				keyword = true,
				variable = true,
				annotation = true
			},
			type = {
				checkTableShape = true,
				inferParamType = true,
			},
			typeFormat = {
				auto_complete_end = true,
				auto_complete_table_step = true,
				format_line = true
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					-- vim.fn.stdpath("data")
				},
				checkThirdParty="apply"
			}
		}
	}
	
})

-- local a = function() return nil end

-- local x = 5 local y = 10
-- local c = x + y
-- print(x+y)
-- local myTable = {
-- 	1,
-- 	2,
-- 	3,
-- 	4,
-- 	5,
-- }
-- myTable.set()
	
