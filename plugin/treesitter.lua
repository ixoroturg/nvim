return {
	"nvim-treesitter/nvim-treesitter",
	name = "nvim-treesitter",
	build = ":TSUpdate",
	enabled = true,
	opts = function()
		local treesitter = require("nvim-treesitter")
		treesitter.install(
			{"html","java","css","typescript","javascript"},
			{summary = true}
		)
		result = pcall(vim.treesitter.start)
		if not result then
			vim.notify("Нет парсера для treesitter")
		end
		local dir = vim.loop.fs_scandir(vim.fn.stdpath("config") .."/treesitter")
		while true do
			local name = vim.loop.fs_scandir_next(dir)
			if not name then break end
			name = "treesitter/" .. name:sub(0,#name-4)
			require(name).setup()
		end
		return {
			install_dir = vim.fn.stdpath("data") .. "/treesitter-languages",
		}
	end,
	lazy = false,
	pin = true,
	submodules = true,
	module = false,
	start = function(treesitter)
		-- print(treesitter)
	end
}
