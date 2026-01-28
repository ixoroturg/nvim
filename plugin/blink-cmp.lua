-- local foo = {bar = 1, baz = 2}
--
-- foo.baz

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets"
	},
	-- version = "1.*",
	opts = {
		fuzzy = {
			implementation = "lua"
		},
		keymap = {
			preset = "enter",
			["<CR>"] = {"fallback"},
			["<C-e>"] = {"accept", "fallback"},
			["<C-C>"] = {"hide", "fallback"},
			["<Tab>"] = {"select_next", "fallback"},
			["<S-Tab>"] = {"select_prev", "fallback"},
			-- ["<C-d>"] = {"show_signature", "hide_signature", "fallback"}
			-- ["<CR>"] = function(cmp)
		},
		cmdline = {
			enabled = true,
			completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false
				}
			}
		}
		},
		signature = {
			enabled = true,
			window = {
				show_documentation = true,
				treesitter_highlighting = true
			},
			trigger = {
				enabled = true,
				show_on_keyword = true,
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true
			}
		},
		completion = {
			keyword = {
				range = "full",
			},
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true
			},
			accept = {
				-- dot_repeat = true,
				auto_brackets = {
					enabled =true,
					default_brackets = {"(",")","{","}"},
					kind_resolution = {
						enabled = true,
					},
					semantic_token_resolution = {
						enabled = true,
					}
				}
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = false
				}
			},
			-- accept = {
			-- 	-- auto_brackets = {"(:)","{:}"}
			-- },
			menu = {
				draw = {
					align_to = "cursor",
					snippet_indicator = "~",
					columns = {
						-- {"label","kind_icon",gap = 1},
						{"kind_icon", "label"}
					}
				},
				-- auto_show_delay_ms
				auto_show = true,
				scrolloff = 2,
				auto_show_delay_ms = 0,
				min_width = 20,
				max_height = 20,
				border = "rounded",
				direction_priority = {"s","n"},
				-- cmdline_position = function()
				-- 	return {5,5}
				-- end
				-- cmdline_position = {5,5}
			},
			ghost_text = {
				enabled = true,
				show_with_menu = true
			}
		},
		sources = {
			default = {
				"lsp","snippets", 
				-- "lazydev"
				-- "path"
				-- "lazydev",
			},
			-- providers = {
			-- 	lazydev = {
			-- 		name = "LazyDev",
			-- 		-- module = "lazydev.integrations.blink",
			-- 		score_offset = 100,
			-- 		enabled = true
			-- 	}
			-- }
		}
	},
}

