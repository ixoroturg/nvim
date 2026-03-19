vim.lsp.config("kotlin",{
	root_markers = {".gradle"},
	-- cmd = {"socat", "TCP-CONNECT:localhost:49100","STDIO"},
	cmd = {"kotlin-language-server"},
	filetypes = {"kotlin"},
	name = "kotlin"
})
