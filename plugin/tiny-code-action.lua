return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{"nvim-lua/plenary.nvim"},
		 {"nvim-telescope/telescope.nvim"}
	 },
	opts = {},
	config = function ()
		vim.keymap.set("n","<leader>ca", function ()
			require("tiny-code-action").code_action()
		end, {desc = "lsp code actions"})
	end
}
