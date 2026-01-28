local key = vim.keymap.set
key("n","<C-k>","<C-w>k",{desc = "окно сверху"})
key("n","<C-j>","<C-w>j",{desc = "окно снизу"})
key("n","<C-h>","<C-w>h",{desc = "окно слева"})
key("n","<C-l>","<C-w>l",{desc = "окно справа"})

key("n","L",":bnext<CR>",{desc = "следующий буфер", silent = true})
key("n","H",":bprev<CR>", {desc = "предыдущий буфер", silent = true})

-- vim.api.nvim_del_keymap("i", "C-Space")
key("i", "<C-Space>", vim.lsp.buf.completion, {desc = "автодополнение"})
