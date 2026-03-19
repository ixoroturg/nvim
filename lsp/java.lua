
vim.lsp.config("java",{
	root_markers = {".classpath",".git",".gradle", "pom.xml", ".mvn"},
	filetypes = {"java"},
	cmd = {"jdtls"},
	name = "java",
	settings = {

	}
})
