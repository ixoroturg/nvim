-- if vim.bo.filetype == "typescriptreact" then
-- 	vim.bo.filetype = "ts"
-- 	vim.opt.commentstring = "// %s"
-- end


vim.lsp.config("typescriptreact",{
	root_markers = {"package.json", "tsconfig.json",".git"},
	cmd = {"typescript-language-server", "--stdio"},
	filetypes = {"typescriptreact"},
	name = "ts"
})
