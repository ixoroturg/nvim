-- vim.keymap.set("n",".","<Nop>",{desc = "иди нахуй"})
-- vim.keymap.del("n",".")
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

	},
	nesting_rules = { -- хуйня ебаная
		-- ["sh"] = {"sh.back"}
		-- ["TypeScript"] = {
		-- 	pattern = "*%.tsx?$"
		-- },
		-- ["Css/Sass"] = {
		-- 	pattern = "*%.(sass | css)$"
		-- },
		-- ["shell"] = {
		-- 	pattern = "*%.sh$"
		-- }
	},
	filesystem={
		window = {
			mapping_options = {
				noremap = true,
				nowait = false
			},
			mappings = {
				["?"] = {
					command = "show_file_details"
				},
				["l"] = {
					command = "open_tab_drop"
				},
				["h"] = {
					command = "close_node"
				},
				["L"] = {
					command = "focus_preview"
				},
				["|"] = {
					command = "open_vsplit"
				},
				["<F5>"] = {
					command = "refresh"
				}
			}
		},
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_hidden = false,
			always_hide = {
				"node_modules",
				".git",
				".project",
				".settings",
				".vscode",
				".metadata"
			},
			hide_by_pattern = {
				"*-lock*"
			}
		},

	},
	source_selector = {
		winbar = true,
		statusline = false,
		show_scrolled_off_parent_node = true,
		sources = {                                               -- table
			{
				source = "filesystem",                                -- string
				display_name = " 󰉓 Files "                            -- string | nil
			},
			{
				source = "buffers",                                   -- string
				display_name = " 󰈚 Buffers "                          -- string | nil
			},
			{
				source = "git_status",                                -- string
				display_name = " 󰊢 Git "                              -- string | nil
			},
		},
	}
}


return {

	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		-- "antosha417/nvim-lsp-file-operations",
		-- "3rd/image.nvim",
		
	},
	opts = cfg,
	config = function ()
		local key = vim.keymap.set

		key("n","<leader>e", ":Neotree toggle<CR>", {silent = true, desc = "открыть neo-tree"})
		require("neo-tree").setup(cfg)
				
		-- return cfg
	end
}

