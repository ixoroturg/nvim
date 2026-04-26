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

vim.api.nvim_create_autocmd("CursorHold", 
{
callback = function()
	-- print("hover")
	vim.lsp.buf.hover()
end
}
-- {desc = "hover при наведении"}
)

local uv = require("luv");


vim.api.nvim_create_user_command("Make", function()


-- vim.uv.new_pipe(false)
-- local pid = vim.uv.spawn(vim.o.makeprg,{},10000)




-- local process = coroutine.create(function()
-- 	local needWrite = true;
-- 	-- uv.spawn();
	local h = io.popen(vim.o.makeprg);
	local result
	if h ~= nil then
		result = h:read("*a");
		h:close();
	end
-- 	if not needWrite then return end;
	vim.cmd("w")
	vim.cmd("botright vnew")
	local buf = vim.api.nvim_get_current_buf();
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "readonly", true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result,"\n"))
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
-- end)
--
-- coroutine.resume(process);
-- vim.defer_fn(function()
-- 	if coroutine.status(process) ~= "dead" then
-- 		process = nil
-- 	end
-- end,10000)

end, {desc = "Улучшенная команда make"})

vim.cmd("cabbrev make Make")


vim.api.nvim_create_autocmd("TextChanged", {
  pattern = "*.ts,*.tsx,*.js,*.jsx",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
      -- Отправляем полный текст, а не инкремент
      local params = vim.lsp.util.make_text_document_params(bufnr)
      client.notify("textDocument/didChange", {
        textDocument = params,
        contentChanges = { { text = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false) } }
      })
    end
  end,
})
