
return {
	"folke/noice.nvim",
	dependencies = {
		"rcarriga/nvim-notify"
	},
	opts = {
		
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = {
					title = " командная строка "
				}
			}
		},
		-- views = {
			-- test = {
			-- 	backend = "popup",
			-- 	relative = "editor",
			-- 	position = {
			-- 		row = 0,
			-- 		col = "100%"
			-- 	},
			-- 	size = "20%"
			--
			--
			-- },
			-- notify_mes = {
			-- 	-- backend = "popup",
			-- 	-- view = "notify",
			-- 	-- backend = {"snacks","notify"},
			-- 	-- format = "notify",
			-- 	view = "notify",
			-- 	opts = {
			-- 		title = "suka"
			-- 	},
			-- 	replace = false,
			-- 	merge = false,
			-- 	-- title = {"my-title","suka"},
			-- 	title = "cerf",
			-- 	relative = "cursor",
			-- 	size = {
			-- 		width = 10,
			-- 		height = 10,
			-- 	},
			-- 	border = {
			-- 		style = "rounded"
			-- 	},
			-- 	position = {
			-- 		row = 5, col = 70
			-- 	}
			-- }
		-- },
		notify = {
			enabled = true,
			view = "notify"
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "split",
			view_search = "virtualtext",
			
			-- format = {
			-- 	title = {title = "k"}
			-- }
		},
		
		routes = {
			{
				filter = {event = "msg_show", find = "suka"}
			}
		},
		hooks = {
			["noice.message.pre-render"] = function(message, event, ...)
				-- print("hook ",vim.inspect(message))
				return message
			end
		}
	}
}
	-- config = function()
	-- 	local noice = require("noice")
	-- 	noice.setup({
	--
	-- 	})
	-- 	-- return {
	-- 	-- 	cmdline = {
	-- 	-- 		enabled = false,
	-- 	-- 		view = "cmdline_popup"
	-- 	-- 	}
	-- 	-- }
	-- end
-- }
