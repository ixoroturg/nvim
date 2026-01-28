local lsp = vim.lsp
local ac = vim.api.nvim_create_autocmd
local M = {}
cfg = {}
M.setup = function()
	ac("FileType", {
		pattern = "lua",
		callback = function(args)
			-- print(vim.inspect(args))
			cfg = {
				name = "lua-ls",
				cmd = { "lua-language-server"},
				filetypes = {"lua"},
				root_dir = "/home/ixoroturg/.config/nvim",
				root_markers = {".git"},
				diagnostics = {
					globals = {
						"vim"
					}
				},
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = {
								"?.lua",
								"?/init.lua",
								"usr/share/lua/5.1/?.lua",
								"usr/share/lua/5.1/?/init.lua",
								"/usr/share/nvim/runtime/lua/?.lua",
								"/usr/share/nvim/runtime/lua/?/init.lua"
							}
						},
						codeLens = {
							enable = true
						},
						hint = {
							enable = true,
							semicolon = "Disable"
						}
					}
				},
				workspace = {
					library = {
						vim.api.nvim_get_runtime_file("lua",true)
					},
					checkThirdParty = true,
				}
			}
			local clients = vim.lsp.get_clients({bufnr = args.bufnr})
			local has_client = false
			for _, client in ipairs(clients) do
				if client.name == cfg.name then
					has_client = true
					break
				end
			end

			if not has_client then
				vim.lsp.config("lua-ls",cfg)
				vim.lsp.enable("lua-ls")
				local client_id = vim.lsp.start_client(cfg)
				vim.lsp.buf_attach_client(0,client_id)
			end
		end
	})
end
return M


