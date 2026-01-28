return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local Popup = require("nui.popup")
		local Layout = require("nui.layout")
		local telescope = require("telescope")
		local action = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local TSLayout = require("telescope.pickers.layout")

		vim.api.nvim_set_hl(0,"Telescope.results", {link = "Normal", bg = "#aaaaff"})
		vim.api.nvim_set_hl(0,"Telescope.preview", {link = "Telescope.results"})
		vim.api.nvim_set_hl(0,"Telescope.promts", {link = "Telescope.results"})

		local function make_popup(options)
			local popup = Popup(options)
			function popup.border:change_title(title)
				popup.border.set_text(popup.border,"top",title)
			end
			return TSLayout.Window(popup)
		end

		local borders = {
			top_left = "┌",
			top = "─",
			top_right = "┐",
			right = "│",
			bottom_right = "┘",
			bottom = "─",
			bottom_left = "└",
			left = "│",
		}

		telescope.setup({
			defaults = {
				path_display = {"filename_first","smart"},
				sorting_strategy = "ascending",
				-- layout_config = {
				-- 	prompt_position = "top"
				-- },
				-- results_title = " Результаты ",
				-- prompt_title = " Поиск"
				mappings = {
					n = {
						["<leader>h"] = action.which_key
					},
					i = {
						["<C-h>"] = action.which_key,
						["<esc>"] = action.close,
						-- ["<C-d>"] = action.delete_buffer
						["<C-n>"] = action.cycle_previewers_next,
						["<C-p>"] = action.cycle_previewers_prev
					}
				},
				
				create_layout = function(picker)
					-- print("Из layout")
					local border = {
						results = borders,
						prompt = borders,
						preview = borders
					}
					local results = make_popup({
						focusable = false,
						border = {
							style = border.results,
							text = {
								bottom = " " ..picker.results_title .. " ",
								bottom_align = "center"
							}
						},
						win_options = {
							winhighlight = "FloatBorder:Telescope.results"
							-- winhighlight = "Normal:Telescope.results",
						}
					})
					local preview = nil
					if picker.preview_title ~= nil then
						preview = make_popup({
							focusable = false,
							border = {
								style = border.preview,
								text = {
									top = " "..picker.preview_title .." ",
									top_align = "center",
								}
							},
							win_options = {
								winhighlight = "Normal:Telescope.preview"
								-- winhighlight = "Normal:Telescope.results,Normal:Telescope.results,Normal:Telescope.results"
								-- winhighlight = {
									-- 	FloatBorder = "Normal:Normal",
									-- 	NormalBorder = "Normal:Telescope.preview",
									--
									-- }
								}
							})
					end
					local prompt = make_popup({
						enter = true,
						border = {
							style = border.prompt,
							-- hl = "Telescope.results",
							text = {
								top = " "..picker.prompt_title .. " ",
								top_align = "center",
							}
						},
						win_options = {
							winhighlight = "Normal:Telescope.prompt",
						}
					})
					local box = nil
					if preview ~= nil then 
					box = Layout.Box({
						Layout.Box({
							Layout.Box(prompt, {size = 3}),
							Layout.Box(results, {grow = 1})
						}, {dir = "col", size = "40%"}),
						Layout.Box(preview, {size = "60%"} )
					}, {dir = "row"})
					else
						box = Layout.Box({
							Layout.Box(prompt, {size = 3}),
							Layout.Box(results, {grow = 1})
						}, {dir = "col", size = "100%"})
					end
					local layout = Layout({
						relative = "editor",
						position = "50%",
						size = "90%",
					}, box)

					layout.picker = picker
					layout.results = results
					layout.prompt = prompt
					if preview ~= nil then
						layout.preview = preview
					end

					return TSLayout(layout)
				end,
			}
		})

		local key = vim.keymap.set

		key("n","<leader>ff",builtin.find_files, {desc = "поиск файла"})
		key("n","<leader>fr",builtin.registers, {desc = "регистры"})
		key("n","<leader>fg",builtin.live_grep,{desc = "поиск в файлах"})
		key("n","<leader>fb", builtin.buffers, {desc = "буферы"})
		key("n","<leader>fh", builtin.help_tags, {desc = "помощь"})
		key("n","<leader>fgb",builtin.git_branches,{desc = "ветки git"})
		key("n","<leader>fgc", builtin.git_commits, {desc = "коммиты git"})
		key("n","<leader>fgs", builtin.git_status,{desc = "статус git"})
		key("n","<leader>fq", builtin.quickfix,{desc = "quickfix лист"})
		key("n","<leader>fl", builtin.loclist,{desc = "location лист"})

		key("n","<leader>cR", builtin.lsp_references,{desc = "lsp references"})
		key("n","<leader>cd", builtin.lsp_definitions,{desc = "lsp definitions"})
		key("n","<leader>ctd", builtin.lsp_type_definitions,{desc = "lsp type definitions"})
		key("n","<leader>ce", builtin.diagnostics,{desc = "lsp diagnostics"})
		key("n","<leader>cws", builtin.lsp_workspace_symbols,{desc = "lsp workspace symbols"})
		key("n","<leader>cds", builtin.lsp_document_symbols,{desc = "lsp documents symbols"})

		key("n","<C-k>",vim.lsp.buf.hover,{desc = "описание"})
		key("n","<leader>ch",vim.lsp.buf.hover,{desc = "описание"})

		key("n","<leader>cr", vim.lsp.buf.rename,{desc = "lsp documents symbols"})

	end
}
