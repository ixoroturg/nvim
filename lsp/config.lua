vim.lsp.config("*",{
	-- before_init = function(init_params,opts)end -- функция, которая запустится перед инициализации сервера. init_params (lsp.InitializeParams) - параметры инициализации, opts - переданное в vim.lsp.start(opts) или от vim.lsp.config
	-- capabilities = {} -- lsp.ClientCapabilities перезаписывает стандартные (vim.lsp.protocol.make_client_capabilities()) возможности lsp сервера
	-- cmd = {} команда запуска lsp сервера
	-- cmd_cwd = "" -- относительно чего выполнять cmd
	-- cmd_env = {var1 = 1, var2 = "some string"} -- переменные окружения для cmd
	-- commands = { {"command name"}, function(lsp.Command, opts) } -- пользовательская функция, которая вызывается, когда lsp что-то делает
	detached = true, -- запускать lsp в демоне
	flags = {
		allow_incremental_sync = true, -- синхронизация буферов
		debounce_text_changes = 500, -- откладывает didChange запрос для lsp на <number>ms
		exit_timeout = false -- nvim завершается как только пошлёт shutdown сигнал lsp. Если установить <number>, то он подождёт это количество ms, перед тем как послать в lsp SIGKILL 
	},
	-- get_language_id = function(bufId, filetypeStr)end -- функция, которая принимает id буфера и тип его файла и возвращает строковый ID языка. По умолчанию возвращает filetype
	-- handlers = {table<LspMethod>,function(Handler)} -- маппинг кастомных обработчиков для ответов lsp сервера
	-- init_options = {} -- опции для initialize запроса для lsp
	-- name = "String" -- имя для логов и человеческого отличия lsp клиентов. По умолчанию client_id
	offset_encoding = "utf-8", -- кодировка для общения с lsp
	-- on_attach = function(Client, bufId)end, -- callback на attach lsp сервера
	-- on_error = function(IntCode,StrError) -- обработчик ошибок. Может быть много обработчиков
	-- on_exit = function(IntExitCode, IntSignal,client_id)end, -- обработчик on_exit
	-- on_init = function(Client, lsp.InitializeResult)end, -- callback после инициализации
	-- root_dir = "" -- путь к директории, где lsp будет искать свои workspace'ы
	-- settings = lsp.LSPObject -- настройки lsp сервера
	-- trace = "off" -- отправляется напрямую в InitializeRequest
	-- workspace_folders = {} -- список директорий workspace, чтобы lsp что-нибудь там нашёл
	workspace_required = true, -- lsp нужен workspace (не работает с одним файлом)
	-- filetypes = {} -- тип файла, на который включается lsp, если активирован через vim.lsp.enable()
	-- reuse_client = function(Client,ClientConfig) return true end, -- переиспользовать ли существующий lsp клиент? По умолчанию true если совпадают name и root_dir
	-- root_markers = {""} -- список строк, если найдены эти файлы, то это root_dir. Не используется, если есть root_dir. Можно указать {{"первая проверка", "вторая проверка"}, {"третья проверка"}}
})

require("lsp/lua")
require("lsp/java")


vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	-- virtual_lines = true,
	signs = true,
	update_in_insert = false,
})
vim.lsp.inlay_hint.enable(true)

-- vim.lsp.ListOpts = 


vim.lsp.enable({"lua", "java"})
