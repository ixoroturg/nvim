vim.opt.allowrevins = true -- позволить на ctrl+_ включать инвертированный режим
vim.opt.ambiwidth = "single" -- размер спец символов, как евро, кириллицы, иероглифов и т.д. Есть ещё "double"
vim.opt.arabic = false -- я не араб
vim.opt.arabicshape = true -- корректирует арабский
vim.opt.autochdir = false -- менять текущую рабочую директорию на директорию буфера
-- vim.opt.autoindent = true -- автоматическая добавка отступа для новой строки
vim.opt.autoread = true -- автоматически читать изменение файла, при редактировании извне
vim.opt.autowrite = false -- автоматически записывать изменения на диск при переключении буферов
vim.opt.autowriteall = false -- как autowrite, но для всех команд (+ edit, enew, exit)
vim.opt.background = "dark" -- тема nvim
vim.opt.backspace = "indent,eol,start" -- позволять стирать отступы, переводы строк и возможность удалять символы перед местом вставки
vim.opt.backup = true -- при сохранении файла всегда создаётся filename~ с прошлым содержимым
vim.opt.backupcopy = "yes" -- работает только вместе с vim.opt.bk, создавать новый файл и переписывать старый
vim.opt.backupdir = "/home/ixoroturg/.nvim/backup,." -- куда сохранять бекапы. Это список через запятую
vim.opt.backupext = "~" -- строка, которая добавляется к имени файла бекапа
vim.opt.backupskip = (function() -- при бекапе игнорировать файлы, в именах которых содержатся соответствующие шаблоны. Редактировать через settings/backup-nvim
	local result = {}
	for line in io.lines("/home/ixoroturg/.config/nvim/settings/backup-ignore") do
		if line and not string.match(line, "^%s*$") and not string.match(line, "^#.*") then
			table.insert(result, line)
		end
	end
	return table.concat(result,",")
end)()
vim.opt.belloff = "all" -- на какие события не срабатывает системный бип
-- vim.opt.belloff = "backspace, cursor"
vim.opt.bin = false -- бинарный режим, показывает байты вместо неподдерживаемых символов. Если очень нужно, то лучше просто nvim -b filename
vim.opt.bomb = false -- добавляет
vim.opt.bomb = false --   добавляет BOM байты для определения последовательности байтов если эта опция включена или режим не бинарный

vim.opt.breakat = "^I!@*-+;:,./? " -- делать визуальный разрыв текста на этих символах
vim.opt.breakindent = true -- разорванные линии имеют тот же отступ, что и оригинал
vim.opt.breakindentopt = "min:60,shift:4,sbr" -- на линии минимум 60 символов, показывать символ разрыва строки, сдвигать новую строку на 4 позиции вправо

vim.opt.bufhidden = "hide" -- скрывать буфер, не выгружая его из памяти
-- vim.opt.buflisted = true -- показывать этот буфер в списках. Эта опция используется макросами и плагинами для скрытых меню.
vim.opt.buftype = "" -- тип буфера. Используется плагинами. help не трогать, nofile - буфер не привязан к файлу (нельзя :w, также имеет фиксированное имя), nowrite - нельзя :w, quickfix - буфер для списка ссылок на ошибки, terminal - буфер, эмулирующий терминал, prompt - буфер с изменяемой только последней строкой, используется в выскакивающем меню для ввода команды у LazyVim
vim.opt.casemap = "internal" -- список, разделённый запятыми. Указывает как менять регистр символов. Ещё одно значение - keepscii
vim.opt.cdhome = false -- когда включена, то :cd команды вместо pwd делают cd в домашнюю папку. Работает только для Windows
-- vim.opt.cdhome = false -- команда :cd без аргументов отправляет в ~
vim.opt.cdpath = ".,./" -- при команде <command> filename, если filename - относительный путь, то искать в этих директориях
vim.opt.cedit = "<C-F>" -- клавиша в режиме комманды (':'), которая откроет историю в режиме редактирования vim и позволит выполнить отредактированную команду
-- vim.opt.channel -- только для буфера. 0, если не подключено, иначе номер соединения. Создаётся отдельно, позволяет использовать буфер nvim для полноценной передачи по сокету
-- vim.opt.charconvert -- функция, которая перекодирует непподдерживаемую кодировку, если встроенная кодировка nvim и iconv() не смогли. Только для чтения, запись может сломаться
vim.opt.cindent = false -- атоматические отступы для C-подобных языков, работает очень слабо
vim.opt.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e" -- кнопки, на которые триггерится cin в insert mode. 0 - на какой позиции считывать символ
vim.opt.cinoptions = "" -- опции для cindent. Их много, сейчас лень смотреть
vim.opt.cinscopedecls = "public,protected,private" -- на какие слова триггерится cino-g
vim.opt.cinwords = "if,else,while,do,for,switch" -- на какие слова тригеррится cin

vim.opt.clipboard = "unnamed,unnamedplus" -- буфер обмена это "+, а так де дублируется в "*
vim.opt.cmdheight = 1 -- количество строк для окна команд
vim.opt.cmdwinheight = 2 -- cmdheight для windows
vim.opt.colorcolumn = "" -- какие строки подсвечивать при hl-ColorColumn
-- vim.opt.columns = "" -- количество столбцов на экране, vim сам это устанавливает
vim.opt.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•" -- на что тирггерится format-comments
-- vim.opt.commentstring = "" -- как обрабатывать комментарий. %s - строка, которую нужно заккоментировать, устанавливается nvim самостоятельно, либо под каждый тип файла
vim.opt.complete = ".,w,b,u,t" -- где искать слова для автозаполнения. . - текущий буфер, w - окна, b - все загруженные буферы в списке, u - буферы не в списке, t - теги
-- vim.opt.completefunc = -- функция, которая вызывается при ctrl+x ctrl+u для автозаполнения, должна вернуть строку
vim.opt.completeitemalign = "kind,abbr,menu" -- порядок показа в автодополнении: тип, сокращение, доп. инфа
vim.opt.completeopt = "fuzzy,menu,menuone,noinsert,noselect,nosort,popup" -- опции автозаполнения
-- vim.opt.completeslash = "" -- опция для windows, перезаписывает shellslash
vim.opt.concealcursor = "" -- в каких режимах спец символы могут быть скрыты
vim.opt.conceallevel = 0 -- как отображать перекрытие спец символов, 0 - всегда показывать
vim.opt.confirm = true -- при несохранённом файле вместо ошибки предлагать диалог да/нет
vim.opt.copyindent = false -- копирует предыдущий отступ, уже есть ai
vim.opt.cpoptions = "BcdEfFILnPrZ_" -- опции для совместимости с Vi
vim.opt.cursorbind = false -- при перемещении между окнами сохранять позицию курсора
vim.opt.cursorcolumn = true -- подсветка колонки курсора
vim.opt.cursorline = true -- подсветка строки курсора
vim.opt.cursorlineopt = "screenline,number" -- подсвечивать строку на экране (не разрывную) и числа

vim.opt.debug = "msg,throw" -- показывать ошибки nvim
vim.opt.define = "" -- паттерн для поиска объявлений
vim.opt.delcombine = false -- в UTF-8 удалять только конкретный символ, а не все с ним связанные
vim.opt.dictionary = "" -- список файлов, в которых ищятся слова для i_ctrl-x ctrl-k
-- vim.opt.diff = false -- флаг для добавления текущего окна к сравнениям
vim.opt.diffexpr = nil -- функция, которая создаст текс, чтобы diff увидел изменения в файлах
vim.opt.diffopt = "closeoff,context:10,filler,followwrap,iblank,internal,iwhite,iwhiteeol,linematch:40,vertical" -- опции сравнения
vim.opt.digraph = false -- копировать ctrl+k на <char1><BS><char2>
vim.opt.directory = "/home/ixoroturg/.backup-nvim/swap" -- директория с файлами .swap для автосохранения
vim.opt.display = "uhex" -- опции отображения. Показывать все символы как <xx>
vim.opt.eadirection = "both" -- автоматическое выравнивание по горизонтали и вертикали при изменении размеров окна
vim.opt.emoji = true -- использовать ширину в 2 символядля эмодзи
vim.opt.encoding = "utf-8" -- кодировка
-- vim.opt.endoffile = false -- добавляет символ конца файла в конец файла
-- vim.opt.endofline = true -- добавляет \n в конец файла
vim.opt.equalalways = true -- при сплите окон давать им одинаковый размер
-- vim.opt.equalprg = "" -- программа, в которую посылается выделеннный текст из =<motion> в stind, а содержимое stdout вставляется в место форматирования
vim.opt.errorbells = true -- использовать БИП, при ошибках (например, <ESC> в normal mode)
vim.opt.errorfile = "errors.err" -- файл ошибок. Куда записать вывод ошибок при :cfile
vim.opt.errorformat = "" -- формат типа scanf, который показывает, как показывать ошибки. По умолчанию очень длинная строка
vim.opt.eventignore = "" -- какие события игнорировать для autocommand
vim.opt.eventignorewin = "" -- ei для окон
vim.opt.expandtab = false -- вместо табов вставлять пробелы
vim.opt.exrc = false -- Автоматически выполнять файл .nvim.lua в текущей директории при открытии
-- vim.opt.fileencoding = "" -- кодировка файла. По умолчанию используется iconv(). Локальный для буфера
vim.opt.fileencodings = "ucs-bom,utf-8,default,latin1" -- глобальный fileencoding
-- vim.opt.fileformat = "unix,dos" -- fileformats для буфера
vim.opt.fileformats = "unix" -- ставить <NL> как EOL
vim.opt.fileignorecase = false -- игнорировать регистр имён файлов
-- vim.opt.filetype = "" -- ручное указание fileType, чтобы стриггерить автокоманду
-- vim.opt.fillchars = "" -- символы для заполнения вертикальных разрывов, строк состояния и т.д. По умолчанию настроено нормально
vim.opt.findfunc = nil -- функция, которая вызывается на :find. Иначе встроенный механизм nvim
vim.opt.fixendofline = true -- автоматически добавлять <EOL> в конец файла, если его нет

vim.opt.foldclose = "" -- сворачивать код в блок, когда курсор выходит из него (при "all") и уровень выше, чем fdl
vim.opt.foldcolumn = "auto" -- сколько колонок отводить на fold
vim.opt.foldenable = true -- включить fold
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- функция, которой даются строки, а она возвращает их уровень fold
vim.opt.foldignore = "#" -- работает только с fdm = indent. Если эти символы встречены в начале строки (пробелы игнорируются), то дать им другой уровень fold
vim.opt.foldlevel = 99 -- вручную установить уровень fold, все высшие уровни закроются
vim.opt.foldlevelstart = -1 -- уровень fold при редактировании другого буфера, в остальном как foldlevel
vim.opt.foldmarker = "//foldstart,//foldend" -- <начало>,<конец>. Какие символы использовать при fold, когда fdm = marker

-- vim.opt.foldmethod = "indent" -- метод отображения fold, syntax - на основе языка, indent - на основе отступов
vim.opt.foldmethod = "expr"
vim.opt.foldminlines = 1 -- минимальное число +1 для сворачивания fold, иначе он не свернётся
vim.opt.foldnestmax = 20 -- максимум 20. Сколько можно создавать уровней fold
vim.opt.foldopen = "all" -- на какие команды открывать fold под курсором
vim.opt.foldtext = "" -- функция для показа текста при fold, обычная показывает количество линий, не указанныя показывает первую строку

vim.opt.formatexpr = nil -- функция для форматирования командой gq
-- vim.opt.formatlistpat = "^\s*\d\+[\]:.)}\t ]\s*" -- паттерн, чтобы определить, что это строка списка
vim.opt.formatoptions = "cro/wn2bB1jp" -- опции форматирования
vim.opt.formatprg = "" -- путь к программе, которая отформатирует текст на gq

vim.opt.fsync = true -- запускать функцию синхронизации файловой системы при записи, чтобы гарантировать безопасную запись
vim.opt.gdefault = false -- команда :s/old/new заменяет все вхождения, а замена одного вхождения это :s/old/new/g (когда true, иначе наоборот)
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"  -- формат вывода :grep
vim.opt.grepprg = "" -- программа, которая вызывается на :grep
vim.opt.guicursor = "n-v-c-sm:block,i-ci:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor" -- gui настройки курсора
vim.opt.guifont = "" -- какие шрифты использовать для gui версии
vim.opt.guifontwide = "" -- шрифты для двухсимвольных символов в gui версии
-- vim.opt.helpfile = "/opt/neovim/share/nvim/runtime/doc/help.txt" -- путь к :help файлам
vim.opt.helpheight = 20 -- высота :help при запуске
vim.opt.helplang = "en" -- предпочтительный язык для документации. fallback всегда в англиийский. Других языков у меня пока нет

vim.opt.hidden = true -- просто скрывать буфер без выгрузки, иначе можно потерять undo историю и изменения в файле
vim.opt.history = 10000 -- сколько команд хранить в истории, максимум 10 000
vim.opt.hlsearch = true -- подсвечивать совпадения в search
vim.opt.icon = true -- устанавливает иконку терминала в иконку редактируемого файла. gnome-terminal работает не всегда
vim.opt.iconstring = "" -- когда не пустой, то устанавливает заголовок терминала в эту строку
vim.opt.ignorecase = true -- игнорировать регист при поиске
vim.opt.iminsert = 0 -- режим раскладки. 0 - стандартный режим, 1 - включить маппинг клавиш lmap, 2 - включить IM - система ввода иероглифов, используется системная программа. Локально для буфера. Переключение обычно на ctrl+^
vim.opt.imsearch = -1 -- какой iminsert использовать при вводе search pattern. -1 - текущий imi, остальные как imi
vim.opt.inccommand = "nosplit" -- когда задано, то показывает предпросмотр результата команды :s. nosplit - не показывать применение команды :s в split окне. (с split показывает и там и там, но окно маленьккой),
vim.opt.include = "" -- паттерн для поиска файлов через [i, ]I, [d
vim.opt.includeexpr = nil -- функция, которая обрабатывает include
vim.opt.incsearch = true -- подсвечивать совпадения паттерна при поиске

-- vim.opt.indentexpr = "v:lua.treesi"
vim.opt.indentexpr = "v:'ua.require('nvim-treesitter').indentexpr()" -- функция, определяющая отступ строки, переписывает ai и cin
vim.opt.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e" -- на какие символы триггерить перерасчёт отступов, только для indentexpr

vim.opt.infercase = false -- при включеном ignorecase если ввели только lowercase буквы, то вставленный автокомплит будет в lowercase. Если мы изначально печатали uppercase, то автокомплит станет uppercase, иначе ничего не случится
vim.opt.isfname = "@,48-57,/,.,-,_,+,,,#,$,%,~,=" -- какие символы могут быть в именах файлов
vim.opt.isident = "@,48-57,_,192-255" -- символы, которые могут быть в ключевых словах
vim.opt.iskeyword = "@,48-57,_,192-255" -- какие символы могу быть к лючевых словах
vim.opt.isprint = "@,161-255" -- эти символы печатаются напрямую в терминал, а не заменяются на, например, <xx>. Кириллица в utf-8 (1024+) всегда печатается
vim.opt.joinspaces = false -- при true ставит 2 пробела после . ! и ? при J
vim.opt.jumpoptions = "view" -- опции для ctrl+O и ctrl+I
vim.opt.keymap = "" -- устанавливает раскладку для imi
vim.opt.keymodel = "startsel,stopsel" -- начинать выделение на Shift + стрелки и заканчивать выделение на не Shift + стрелки
vim.opt.keywordprg = "man" -- программа, которая используется при K
vim.opt.langmap = "йцукенгшщзхъэждлорпавыфячсмитьбю.;qwertyuiop[]'\\;lkjhgfdsazxcvbnm\\,./,ЙЦУКЕНГШЩЗХЪЭЖДЛОРПАВЫФЯЧСМИТЬБЮ.;QWERTYUIOP[]'\\;LKJHGFDSAZXCVBNM\\,./" -- переводить этисимволы;вэти,несколько;групп переводов. Нужно, чтобы на русской раскладке можно было выполнять команды vim
vim.opt.langmenu = "" -- язык для перевода меню, видимо переводит даже вставку автокомплита
vim.opt.langremap = false -- выключает перевод при автокомплите
vim.opt.laststatus = 2 -- когда показывать статус окна "settings/options.lua [+]". 0 - никогда, 1 - если минимум 2 окна, 2 - всегда, 3 - всегда и только у последнего окна
vim.opt.lazyredraw = false -- не перерисовывать окно при работе макроса, регистров и других команд, которые не пишутся

vim.opt.linebreak = true -- разрывать длинные строки на несколько
-- vim.opt.lines = количество линий в nvim. nvim сам устанавливает при изменении размера шрифта или окна
vim.opt.linespace = 0 -- количество пикселей между линиями, только для gui версии
vim.opt.lisp = false -- при нажатии <enter> новая строка имеет отступ согласно стандарту lisp, ai должен быть включен
vim.opt.lispoptions = "" -- опции отступа при lisp
-- vim.opt.lispwords = "" -- на какие слова тригеррится lisp. По умолчанию большая строка
vim.opt.list = true -- показывать табы как >, пробелы как - и другие пробелы как +
vim.opt.listchars = "tab:> ,trail:-,nbsp:+" -- символы для заменещия невидивых символов
vim.opt.loadplugins = true -- загружать плагины
vim.opt.magic = true -- использовать спец символы в паттернах
vim.opt.makeef = vim.fn.fnamemodify(vim.opt.mp:get(),":p:h") .. "/make.error"
-- vim.opt.makeef = "./make.error" -- имя файла с ошибками при :make
vim.opt.makeencoding = "utf-8" -- кодировка внешних файлов при :make
vim.opt.makeprg = (function()
	local file = vim.fn.findfile("build", vim.fn.expand("%:p:h"))
	-- print(vim.fn.expand("%:p:h"))
	if file ~= nil then
		local filePath = vim.fn.expand(vim.fn.findfile("build", vim.fn.expand("%:p:h") .. ";"))
		-- print("expand " .. vim.fn.fnamemodify(filePath, ":p"))
		return vim.fn.fnamemodify(filePath, ":p")
	end
	return nil
	-- print(filePath)
	-- filePath = vim.fn.expand(filePath:p)
	-- return "/bin/bash -c " .. filePath;
end)()
vim.opt.matchpairs = "(:),{:},[:],<:>" -- на какие скобки работает %
vim.opt.matchtime = 3 -- e-1, сколько времени показывать sm
vim.opt.maxfuncdepth = 100 -- максимальная глубина стека вызова функции, позволяет избежать бесконечной рекурсии
vim.opt.maxmapdepth = 1000 -- максимальная глубина сочетаний клавиш, позволяет избежать :map x y и :map y x
vim.opt.maxmempattern = 1000 -- размер в Kbyte, сколько памяти выделять для парсинга регулярки. Позволяет не зависнуть намертво при неадекватной регулярке или размере файла
vim.opt.menuitems = 25 -- сколько пунктов меню отображать в gui версии
vim.opt.messagesopt = "hit-enter,history:500" -- hit-enter - еслисообщение не помещается в ch, то показывать его полностью и просить нажать <enter>. wait:<milliseconds> - вместо <enter> ждать это время и автоматически закрывать сообшение. history - ращмер истории сообщений, обязательный параметр
vim.opt.mkspellmem = "460000,2000,500" -- количество памяти в Kbyte, которое используется при парсинге словаря. 1 - когда начинать сжатие словаря, 2 - какой объём памяти попытаться сжать, 3 - на сколько увеличить 2 (нужно, чтобы сильнее сжать и чтобы в начале не зависнуть)
vim.opt.modeline = false -- при открытии файла проверять mls строк в начале и конце, чтобы найти паттерн <что-то>vim:<пробел><команда> и выполнить это. Можно также использовать vi:
vim.opt.modelineexpr = false -- разрешить использовать функции в modeline
vim.opt.modelines = 0 -- сколько читать строк в начале и конце для ml
-- vim.opt.modifiable = true -- можно ли изменять буфер
-- vim.opt.modified = false -- изменён ли буфер. Внутренняя настройка vim
vim.opt.more = true -- если вывод команды не помещает на экран, то пагинировать её с отметкой -- more --, иначе просто выплюнет всё и на любое действие закроет окно
vim.opt.mouse = "nvicr" -- использовать мышь в нормальном, визуальном, режиме вставка, командной строке и при press ENTER в сообщениях
vim.opt.mousefocus = true -- переводить фокус на окно, на которое наведена мышь. Не работает в gnome-terminal
vim.opt.mousehide = false -- мышь перестаёт рисоваться при вводе текста, появляется, если сдвинуть её, только для GUI
vim.opt.mousemodel = "popup_setpos" -- при extend ПКМ переопределяет выделение, с popup показывает контекстное меню. popup_setpos дополнительно ставит курсор в место клика ПКМ
vim.opt.mousemoveevent = false -- передавать ли движения мыши в сочетания клавиш
vim.opt.mousescroll = "ver:3,hor:6" -- на сколько строк/столбцов прокручивать экран при использовании СКМ, горизонтальный не работает
vim.opt.mousetime = 500 -- количество миллисекунд, которое считать за двойной клик
vim.opt.nrformats = "alpha,octal,hex,bin,blank" -- как работают ctrl+a и ctrl+x. alpha - изменять 1 символ английского алфавита под курсором, octal - числа, начинающиеся с 0 -восьмиричные, hex - числа, начинающиейся с 0x - шестнадцатиричные, bin - числа, начинающиеся с 0b или 0B - двоичные. blank - требовать пробельный символ перед '-', чтобы '-' считался частью числа, unsigned - игнорировать '-' как знак отрицательности числа
vim.opt.number = true -- номер строк

vim.opt.numberwidth = 4 -- минимальное количество колонок для отображения чисел
vim.opt.omnifunc = nil -- какая функция вызывается на ctrl+x ctrl+o
vim.opt.operatorfunc = nil -- какая функция вызывается на g@<motion>. Как d, y, c, но кастомная
-- vim.opt.packpath = "" -- директории, в которых надо искать пакеты
-- vim.opt.paragraphs = "" -- метки из man формата, на которые триггерится описание параграфа
vim.opt.patchexpr = nil -- функция, которая применяют дельту из файла с изменениями (как git diff) к этому файлу
vim.opt.patchmode = "" -- если указано, то первая перезапись файла создаст его копию со строкой pm в конце файла, чтобы сохранить оригинал
-- vim.opt.path = "" -- список директорий, где будет работать :find, если указан относительный путь файла
vim.opt.preserveindent = false -- при >> и << оставлять отступы как есть и прибавлять/удалять таб/пробелы. сохраняет оригинальный отступ, а не перезаписывать его

vim.opt.previewheight = 12 -- высота для превью тега при :ptag или ctrl+w }
-- vim.opt.previewwindow = false - индикатор, что это окно preview. Ставится через :pedit и :ptag
vim.opt.pumblend = 0 -- прозрачность popup
vim.opt.pumheight = 15 -- максимальное количество слов в меню автокомплита. 0 - использовать всю высоту
vim.opt.pumwidth = 15 -- минимальная ширина меню автокомплита
vim.opt.pyxversion = 3 -- версия pyx* у pithon. Работает только 3
vim.opt.quickfixtextfunc = nil -- функция, которая создаёт текстовое описание в quickfix
vim.opt.quoteescape = "\\" -- какой символ используется для экранирования кавычек, чтобы a', a", a` и другие команды нормально работали
-- vim.opt.readonly = false -- устанавливает текущему буферу состояние read-only
vim.opt.redrawdebug = "" -- опции для дебага отрисовки, например, делать задержку после отрисовки каждой строки
vim.opt.redrawtime = 2000 -- если подсветка синтаксиса занимает времени больше, чем 2000 миллисекунд, то подсветка прекращается
vim.opt.regexpengine = 0 -- движок regex, 0 - автомат (использует NFA, если обычный слишком долгий), 1 - старый и рабочий, 2 - NFA, выдаёт false если не поддерживает регулярку
vim.opt.relativenumber = true -- показывать относительные номера строк
vim.opt.report = 0 -- если ':' команды изменяют больше, чем report строк, то сообщать об этом
vim.opt.revins = false -- выключение инвертированного режима
vim.opt.rightleft = false -- при true показывает текст справо налево
vim.opt.rightleftcmd = "search" -- какие команды будут работать в режиме rl, при rl = true
vim.opt.ruler = true -- показывать позицию курсора и относительное местоположение в файле. Не используется, т.к. перезаписывается stl
-- vim.opt.rulerformat = "%15(%l:%v/%L %p%%%)" -- формат ru. Не используется, т.к. перезаписывается stl
-- vim.opt.runtimepath = "" -- список директорий, где nvim ищет свои файлы
vim.opt.scroll = 0 -- 0 - сброс по умолчанию. Указывает на сколько линий перемещать курсор при ctrl+u и ctrl+d
vim.opt.scrollback = 10000 -- сколько линий запоминать в окне в :term
-- vim.opt.scrollbind = false -- установить этому окну привязку скролла. Тогда все окна с scb = true будут скролиться одновременно
vim.opt.scrolljump = -50 -- сколько линий показывать при скролле j и k. Отрицательное значение интерпретируется как процент высоты окна. Больше -50 не работает
vim.opt.scrolloff = 10 -- сколько линий оcтавлять снизу перед прыжком в sj
vim.opt.scrollopt = "ver" -- синхронизировать вертикальное перемещение при scrollbind. Ещё есть hor и jump, который сохраняет относительно смещение между окнами
-- vim.opt.sections = "" -- какие маркеры в формате nroff показывают границы секций
vim.opt.selection = "inclusive" -- не включает последний пробельный символ в выделение или первый символ после пробелов при прыжках по словам
vim.opt.selectmode = "key,mouse" -- на стрелки клавиатуры с Shift и на мышь включает select mode
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,localoptions,skiprtp,resize,tabpages,winsize,winpos,terminal" -- что сохранять при :mksession. curdir - переходить в директорию на момент сохранения сессии. sesdir - переходить в директорию сессии. Без них - никуда не переходить. Нельзя поставить сразу оба

vim.opt.shada = "!,%50,'100,<50,s10,h" -- опции shada. Как ssop, только 1 на всю систему. % - сохранять список буферов, < - максимальное количество строк в регистрах (s - длина в KiB)
vim.opt.shadafile = "" -- переписывает имя файла shada (viminfo)

vim.opt.shell = "/bin/bash" -- путь к оболочке при :!command
vim.opt.shellcmdflag = "-c" -- флаг для sh, чтобы было /bin/bash -c "command"
vim.opt.shellpipe = "2>&1| tee" -- после команды :make добавить это и название файла. Название файла подставляется в конец или в %s.
vim.opt.shellquote = "" -- во что оборачивать команду в :! Нужно в основном для Windows. В Unix не трогать. Не включает перенаправление
vim.opt.shellredir = "%s 2>&1" -- как перенаправлять вывод :! в временный файл
vim.opt.shellslash = true -- для имён файлов использовать '/'. Можно писать '\', vim автоматически переведёт это в '/'
vim.opt.shelltemp = false -- true - писать в файл, читать из него и удалять. false - писать прямо в vim.

vim.opt.shellxescape = "" -- какие символы экранировать с помощью '^'. Для Windows
-- vim.opt.shellxquote = "" как shq, он включая перенаправление, нельзя указывать оба
vim.opt.shiftround = true -- округляет отступ до sw при i_ctrl-t, i_ctrl-d и для >> и <<
vim.opt.shiftwidth = 4 -- размер отступа

vim.opt.shortmess = "l" -- опции для сообщений от команд

vim.opt.showbreak = "↪ " -- какой символ ставится в начале переноса разрывной строки
vim.opt.showcmd = true -- показывать незаконченные команды типа di, ya
vim.opt.showcmdloc = "statusline" -- где показывать sc
vim.opt.showfulltag = true -- показывать полную сигнатуру тега при автокомплите
vim.opt.showmatch = true -- при закрытии парных символов пригать на открывающий символ (если он в пределах экрана и потом обратно)
vim.opt.showmode = true -- показывать реджим (-- INSERT --, -- VISUAL --) в последней строке команд
vim.opt.showtabline = 2 -- 0 - не показывать строку вкладок, 1 - показывать строку вкладок, если их больше 1, 2 - показывать всегда
vim.opt.sidescroll = 0 -- на сколько прокручивать экран при горизонтальном скролле, когда wrap выключен. 0 - половина экрана
vim.opt.sidescrolloff = 10 -- сколько оставлять символов у края экрана перед прыжком
vim.opt.signcolumn = "auto" -- размер и когда показывать колонку значков (breakpoint, git, ошибки у LSP), auto - показывать столько колонок, сколько надо и только если есть метка
vim.opt.smartcase = true -- работает вместе с ic. Если вводить только маленькие буквы, то не учитывает регистр, если есть хоть 1 заглавная буква, то учитывать регистр
vim.opt.smartindent = true -- умные отступы. Ставит отступ, если линия закончилась на {. Если в начале строки пишется }, то он получает такой же отступ, как и открывающий {. Также ставит отступ, если линия заканчивается на слово из cinwords
vim.opt.smarttab = true -- backspace и tab ставят/удаляют такой размер, чтобы совпасть с shiftwidth

vim.opt.smoothscroll = true -- если сверху есть обрезанный конец разорванной строки, то показывать 1 линию и текущие линии, иначе не покажет ничего
vim.opt.softtabstop = 0 -- 0 - отключает. Эмулировать нажатие таба пробелами и табами, чтобы отступ был по sts. Работает только после 1 не пробельного символа

vim.opt.spell = true -- включить проверку орфографии
vim.opt.spellcapcheck = "[.?!]_[\\]\\}\\)]'\"\t ]+" -- ищет регулярку, и если после неё стоит маленькая буква, то она подсвечивается hl-SpellCap 
vim.opt.spellfile = "" -- путь к файлу личного словаря. Используется при zg и zw, если пустой, то ищет файл в runtimepath
vim.opt.spelllang = "en,ru" -- подключает системный словарь соответствующего языка
vim.opt.spelloptions = "noplainbuffer" -- использовать spell только при syntax = true и только в местах extmark
vim.opt.spellsuggest = "fast,timeout:2000" -- использовать алгоритм fast (хорош для ошибок во время набора) и максимальное время поиска исправлений 2000ms
vim.opt.splitbelow = true -- новое окно появляется снизу, а не сверху
vim.opt.splitright = true -- новое окно появляется справа, а не снизу
vim.opt.startofline = true -- при прокручивании страниц переводить курсор на первый не пустой символ строки

vim.opt.statuscolumn = "%l " -- в статусной колонке показывать номер строки
vim.opt.statusline = "%Y:%(%-w %-a%) %-F%( %-h%-m%-r%), под курсором: %-B %=%S %(%l:%v/%L %p%%%)" -- параметры statusline. Примечание: %#highlightGroupName# переключает подсветку до следующей %#hlGroupName#
vim.opt.suffixes = ".bak,~,.0,.h,.info,.swp,.obj" -- при совпадении имён двух файлов (при неполной записи) эти файлы имеют меньший приоритет
-- vim.opt.suffixesadd = "" -- gf на слове будет искать файл <слово>suffixesadd
vim.opt.swapfile = true -- включить swap файлы, они находятся в vim.opt.directory
vim.opt.switchbuf = "useopen,usetab,vsplit" -- при переходе по :quicklist и ctrl-w_f и ctrl-w_F искать буфер в открытом окне, табе или разделять экран пополам вертикально
vim.opt.synmaxcol = 3000 -- после 3000 символов в одной строке перестанет подсвечивать синтакс.
vim.opt.syntax = "" -- использовать конкретный синтакс (работает по регуляркам), например syntax=java. fallback для treesitter или чтобы посмотреть часть файла syntax=json
vim.opt.tabclose = "uselast" -- при закрытии таба прыгать на последний использовавшийся таб
vim.opt.tabline = "%!v:lua.createCustomTabLine()" -- как statusline, но для табов (верхняя строка)

function createCustomTabLine()
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()
	-- print("tabs count: " .. #tabs .. ", current: " .. current)
	local s = ""
	for i, tab in ipairs(tabs) do
		-- print(i.." "..tab)
		local tabName = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))), ":t")
		if tabName == nil or tabName == "" then
			tabName = "пусто"
		end
		if tab == current then
			tabName = "[" .. tabName .. "]"
		end
		s = s .. "%"..i.."T" .. tabName .. "%" .. i .."T "
	end
	return s
end
vim.opt.tabpagemax = 50 -- максимальное количество открытия табов при :tab all и аргумента cli -p
vim.opt.tabstop = 4 -- скольким пробелам соответствует таб
vim.opt.tagbsearch = true -- использовать алгоритм бинарного поиска при поиске тегов
vim.opt.tagcase = "followscs" -- следовать ignorecase и smartcase при сопоставлении реестра
vim.opt.tagfunc = nil -- функция, которая ищет тэги
vim.opt.taglength = 0 -- если 0, то ищёт полное совпадение с тегом. иначе использует первый тег, у которого совпадает текущее количество символов
vim.opt.tags = "/home/ixoroturg/.config/nvim/test.tag" -- путь к файлам с тегами
vim.opt.tagrelative = true -- считать пути к файлам из тега как относительные к расположению файла тега
vim.opt.tagstack = true -- использовать стек тегов как стек, иначе команды не изменяют сам стек
vim.opt.termbidi = false -- не ставит терминал в RTL, если включен arabic
vim.opt.termguicolors = true -- использовать 24-битные цвета в TUI nvim
vim.opt.termpastefilter = "BS,HT,ESC,DEL" -- убирать backspace, tab, escape и delete символы при вставке в терминальный буфер
vim.opt.termsync = true -- буферизирует все отрисовки терминала, чтобы отрисовать его 1 раз
vim.opt.textwidth = 0 -- превышение длины текста переводит строку на новую строку, 0 отключает это
vim.opt.thesaurus = "" -- список файлов, для команда i_ctrl+x ctrl+t. Список синонимов
vim.opt.thesaurusfunc = nil -- функция, которая вызывается перед вставкой thesaurus
vim.opt.tildeop = false -- команда ~ (смена регистра) работает как операторы y,c,d (при false можно с g~)
vim.opt.timeout = true -- если есть маппинг на a и ab, то при нажатии a ждёт кнопки b, если её нет, то выполнит a
vim.opt.timeoutlen = 1000 -- сколько ms ждать timeout
vim.opt.title = true -- заголовок окна приложения становится именем файла с доп информацией
vim.opt.titlelen = 85 -- процент от ширины окна, занимаемого заголовком окна от title
-- vim.opt.titleold = "lox" -- при закрытии nvim устанавливает заголовок окна в это, не работает
vim.opt.titlestring = "nvim:%f%m" -- statusline для title
vim.opt.ttimeout = true -- при нажатии свециальных клавиш <F2>,<F3> терминал посылает 0x1b (ESC) и код клавиши. Эта настройка определяет сколько ждать этот код, иначе будет просто ESC
vim.opt.ttimeoutlen = 50 -- сколько ms ждать ttimeout
vim.opt.undodir = "/home/ixoroturg/.nvim,." -- папка с undo файлами
vim.opt.undofile = true -- сохранять undo историю в файле
vim.opt.undolevels = 100 -- максимальное число undo в истории 
vim.opt.undoreload = 10000 -- сохраняет всю историю undo, если в файле меньше этого количества строк, при переоткрытии файла при изменении его другими программами

vim.opt.updatecount = 200 -- после стольких введёных символов делать запись swap файла на диск
vim.opt.updatetime = 4000 -- если столько ms ничего не происходит, то swap файл записывается на диск
vim.opt.varsofttabstop = "" -- числа через запятую. Табы расширяются до указанного количества символов. Для 8,32,8 это означает, что первый таб всегда остановится на 9, второй на 41, а далее табы будут прибавлять по 8. Игнорирует tabsoftstop, использует табы и пробелы в перемешку
vim.opt.vartabstop = "" -- тот же vartabstop, но использует только табы (я так понимаю вставляет 1 таб и визуально его растягивает)
vim.opt.verbose = 0 -- уровень логирования
vim.opt.verbosefile = "/home/ixoroturg/.nvim/verbosefile" -- если указан, то все verbose пишутся в него
vim.opt.viewdir = "/home/ixoroturg/.nvim/view" -- куда сохранять файлы от :mkview (сохраняет всё от текущего окна)
vim.opt.viewoptions = "cursor,curdir,folds,options,localoptions,slash,unix" -- что сохранять при :mkview (всё)

vim.opt.virtualedit = "onemore" -- позволяет устанавливать курсор на несуществующий символы. onemore - на один символ после строки
vim.opt.visualbell = true -- использовать визуальный сигнал, вместо звукового бипа
vim.opt.warn = true -- выдавать предупреждение при попытке выполнить shell команду с несохранённым буфером
vim.opt.whichwrap = "b,s" -- каким кнопкам, которые отвечают за лево/право разрешено переходить по строкам, только backspace и space
vim.opt.wildchar = 9 -- на какую кнопку (tab) открывать меню автокомплита для командной строки
vim.opt.wildcharm = 9 -- тот же wildchar, но этот символ запоминает для команд в скриптах
vim.opt.wildignore = "" -- игнорировать файлы с такой регуляркой при поиске имён файлов
vim.opt.wildignorecase = true -- игнорировать регистр файлов в автокомплите
vim.opt.wildmenu = true -- включает расширенные действия при автокомплите в командной строке
vim.opt.wildmode = "longest,full" -- опции wildcard. Дополнять до максимального совпадения, а на второй таб запускать меню выбора. 
vim.opt.wildoptions = "pum,tagfile" -- опции wildcard. pum - popup меню выбора, tagfile - показывать файлы, где находится тег при поиске тега
vim.opt.winaltkeys = "no" -- только для windows. Не даёт использовать ALT+кнопка для перехода в пункт меню. Можно настроить маппинг на ALT
vim.opt.winbar = "%f" -- statusline для верхней строки окна
vim.opt.winblend = 0 -- прозрачность плавающих окон. Не i_CTRL+X или wildcard
vim.opt.winborder = "rounded"
-- vim.opt.window = 0 -- размер окна - 1 на которое прыгают ctrl+f и ctrl+b. Ставится автоматически
-- vim.opt.winfixbuf = false -- не даёт менять буфер окна
vim.opt.winfixheight = false -- не изменять высоты окна при сплите
vim.opt.winfixwidth = false -- не менять ширину окна при сплите
vim.opt.winheight = 1 -- минимальная высота активного окна при сплите
vim.opt.winhighlight = "" -- меняет парами hl текущего окна на другие hl
vim.opt.winminheight = 1 -- минимальная высота неактивного окна при сплите
vim.opt.winminwidth = 1 -- минимальная ширина неактивного окна при сплите
vim.opt.winwidth = 20 -- минимальная ширина активного окна при сплите

vim.opt.wrap = true -- визуально разрывать большие строки
-- vim.opt.wrapmargin = 0 -- вставляет <EOL>, если осталось меньше чем это число символов до конца экрана. Работает только в режиме вставки.
vim.opt.wrapscan = true -- при поиске при достижении конца файла зацикливать поиск
-- vim.opt.write = true -- позволяет записывать файлы на диск. Внутреннее использование
vim.opt.writeany = false -- позволяет записывать файлы без !
vim.opt.writebackup = true -- перед перезаписью файла делается бекап который удаляется после успешной записи файла
vim.opt.writedelay = 0 -- работает только с redrawdebug. Сколько ms ждать перед отрисовкой каждой строки
