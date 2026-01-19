return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim"
	},
	config = function()
		local telescope = require("telescope")
		local action = require("telescope.actions")
		local builtin = require("telescope.builtin")
		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["<leader>h"] = action.which_key
					},
					i = {
						["<C-h>"] = action.which_key
					}
				},
				layout_config = {
					vertical = {width = 0.1}
				}
			}
		})
		local key = vim.keymap.set
		key("n","<leader>ff",builtin.find_files, {desc = "поиск файла"})
		key("n","<leader>fg",builtin.live_grep,{desc = "поиск в файлах"})
		key("n","<leader>fb", builtin.buffers, {desc = "буферы"})
		key("n","<leader>fh", builtin.help_tags, {desc = "помощь"})
		key("n","<leader>fgb",builtin.git_branches,{desc = "ветки git"})
		key("n","<leader>fgc", builtin.git_commits, {desc = "коммиты git"})
		key("n","<leader>fgs", builtin.git_status,{desc = "статус git"})
	end
}
