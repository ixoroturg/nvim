-- local pluginList = {}
function import(path)
  local dir = vim.loop.fs_scandir(path)
  local result = {}
  while true do
    local name = vim.loop.fs_scandir_next(dir)
    if not name then break end
    if(name:match("%.lua$")) then
      name = name:sub(0,#name-4)
      local plugin = require("plugin/"..name)
      table.insert(result,plugin)
      -- pluginList.plugin = plugin.name
      -- table.insert(pluginList, require(plugin.name))
    end
  end
	--  table.insert(result,
	-- 	{
	-- "folke/lazydev.nvim",
	-- ft = "lua"}
	--  )
  return result
end

local lazypath = vim.fn.stdpath("config") .. "/lazy-vim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({	"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
	if vim.v.shell_error ~= 0 then vim.api.nvim_echo({
			{"Failed to clone lazy.nvim:\n"},
			{out},
			{"repository: " .. lazyrepo}
			-- {"\nPress any key to exit..."}
		}, true, {})
		-- vim.fn.getchar()
		return
	end
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/plugin",
	lazy = false,
	version = "*",
	local_spec = true,
	lockfile = vim.fn.stdpath("config") .."/lazy-vim/lazy-lock.json",
	concurrency = 4,
	git = {
		log = {"-5"},
		timeout = 60,
		url_format = "https://github.com/%s.git",
		filter = true,
		throttle = {
			enabled = false,
			rate = 5,
			duration = 10 * 1000,
		},
		cooldown = 5
	},
	pkg = {
		enabled = true,
		cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
		sources = {
			"lazy",
			"rockspec",
			"packspec"
		}
	},
	rocks = {
		enabled = true,
		root = lazypath .. "/lazy-rocks",
		server = "https://lumen-oss.github.io/rocks-binaries/",
		hererocks = nil
	},
	install = {
		missing = true
	},
	ui = {
		size = {width = 0.8, height = 0.8},
		wrap = true,
		border = "rounded",
		backdrop = 0,
		title = "Lazy Vim Startup",
		title_pos = "center",
		pills = true,
		-- icons нужно будет настроить
		browser = nil,
		throttle = 1000 / 30,
		-- custom_keys
	},
	headless = {
		process = true,
		log = true,
		task = true,
		colors = true
	},
	diff = {
		cmd = "git"
	},
	checker = {
		enabled = false,
		concurrency = 4,
		notify = true,
		frequency = 3600,
		check_pinned = false
	},
	change_direction = {
		enabled = true,
		notify = true
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = {},
			disabled_plugins = {

			},
		},
	},
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = {"README.md","lua/**/README.md"},
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json",
	profiling = {
		loader = true,
		require = true
	},
	spec = import(vim.fn.stdpath("config") .. "/plugin")
})

-- vim.treesitter.start()
-- treesitter = require("nvim-treesitter")
-- treesitter.install("java",{summary = true})

-- require("nvim-treesitter.configs")
-- vim.treesitter.install("java",{summary = true})

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function(event)
--     print("Все плагины загружены")
--     print(event.data)
--     require("nvim-treesitter.configs")
--   end,
--   once = true
-- })


-- vim.api.nvim_create_autocmd("User", {
--   pattern = "TSUpdate",
--   callback = function()
--     require("nvim-treesitter.parsers")
--   end
-- })

-- require("nvim-treesitter.configs").setup({
--   ensure_installed = {"java"},
--   highlight = {enabled = true}
-- })
