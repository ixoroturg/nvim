
local cfg = {
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	clipboard = {
		sync = "universal"
	},
	default_component_configs = {
		container = {
			enable_character_fade = false
		},
		
	}
}


return {
	
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"MunifTanjin/nui.nvim",		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		-- "antosha417/nvim-lsp-file-operations",
		-- "3rd/image.nvim",
		
	},
	opts = cfg,
	config = function ()
		local key = vim.keymap.set

		key("n","<leader>e", ":Neotree toggle<CR>")
		require("neo-tree").setup(cfg)
				
		-- return cfg
	end
}

