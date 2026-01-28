vim.api.nvim_create_user_command("ConfigReload", function()
	vim.cmd("so $MYVIMRC")
	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		vim.lsp.stop_client(client.config)
		vim.lsp.start(client.config)
		-- vim.lsp.enable(client.name, false)
		-- vim.lsp.enable(client.name, true)
	end
	-- lsp.diba
	-- require("lsp/config")
end, {desc = "Перезагрузка конфига"})
