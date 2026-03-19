local key = vim.keymap.set
key("n","<C-k>","<C-w>k",{desc = "окно сверху"})
key("n","<C-j>","<C-w>j",{desc = "окно снизу"})
key("n","<C-h>","<C-w>h",{desc = "окно слева"})
key("n","<C-l>","<C-w>l",{desc = "окно справа"})

key("n","L",":bnext<CR>",{desc = "следующий буфер", silent = true})
key("n","H",":bprev<CR>", {desc = "предыдущий буфер", silent = true})
-- vim.api.nvim_del_keymap("i", "C-Space")
key("i", "<C-Space>", vim.lsp.buf.completion, {desc = "автодополнение"})

key("n", "<leader>bd", ":bdelete<CR>",{desc = "удалить буфер", silent = true})
key("n", "<Tab>", ":tabnext<CR>",{desc = "следующий таб", silent = true})
key("n", "<S-Tab>", ":tabprev<CR>",{desc = "предыдущий таб", silent = true})

-- key("n","l","gl",{noremap = true, silent = true, desc = "движение вправо"})
-- key("n","h","gh",{noremap = true, silent = true, desc = "движение влево"})
key("n","k","gk",{noremap = true, silent = true, desc = "движение вверх"})
key("n","j","gj",{noremap = true, silent = true, desc = "движение вниз"})
key("n","$","g$",{noremap = true, silent = true, desc = "до конца визуальной строки"})
key("n","g$","$",{noremap = true, silent = true, desc = "до конца строки"})
key("n","0","g0",{noremap = true, silent = true, desc = "В начало визуальной строки"})
key("n","g0","0",{noremap = true, silent = true, desc = "В начало строки"})
