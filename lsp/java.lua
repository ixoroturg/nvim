-- vim.lsp.config("java",


-- vim.lsp.log.set_level(vim.log.levels.DEBUG)
local cfg = {
	root_markers = {"build", ".classpath",".git",".gradle", "pom.xml", ".mvn", "build"},
	filetypes = {"java"},
	-- cmd = {
	-- 	"jdtls",
	-- 	"-data", vim.fn.expand("~/java/workspace"),
	-- 	"-configuration", vim.fn.expand("~/java/config")
	--
	-- },
	cmd = {
		"/bin/sh",
		"-c",
		"jdtls"

		-- "strace",
		-- "-f",
		-- "-e", "openat,stat,access,read",
		-- "-o", "/tmp/jdtls.log",
		-- "jdtls"

		-- "/bin/sh",
		-- "-c",
		-- "jdtls -data "..vim.fn.expand("~/java/workspace").." -configuration "..vim.fn.expand("~/java/config").." | tee "..vim.fn.expand("~/java/jdtls.log")
	},
	name = "java",
	settings = {
		java = {
			contentProvider = {preferred = "fernflower"},
			eclipse = {
				downloadSources = true
			},
			project = {
				encoding = {
					default = "utf-8"
				}
			},
			home = "/usr/lib/jvm/java-25-openjdk",
			configuration = {
				runtimes = {
					-- {
					-- 	name = "JavaSE-21",
					-- 	path = "/usr/lib/jvm/java-21-openjdk",
					-- 	sources = "/usr/lib/jvm/java-21-openjdk/lib/src.zip"
					-- },
					-- {
					-- 	name = "JavaSE-25",
					-- 	path = "/usr/lib/jvm/java-25-openjdk",
					-- 	sources = "/usr/lib/jvm/java-25-openjdk/lib/src.zip",
					-- 	default = true
					-- }
				}
			},
			signatureHelp = {
				enabled = true
			}
		}

	}
}
return cfg;
-- )
