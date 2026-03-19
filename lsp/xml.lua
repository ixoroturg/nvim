vim.lsp.config("xml",{
	root_markers = {".git", "pom.xml", "init.lua","standalone.xml", "jboss-modules.jar", "settings.xml"},
	filetypes = {"xml"},
	-- cmd = {"java", "-jar", "/home/ixoroturg/.config/nvim/lsp/ibm-xml-server-all.jar" },
	cmd = {"/home/ixoroturg/.config/nvim/lsp/lemminx-linux"},
	name = "xml-ls",
	settings = {}
	}
)
