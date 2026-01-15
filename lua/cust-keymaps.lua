vim.g.mapleader=" "

--generic
vim.keymap.set('i', 'jk' , '<ESC>',{})

--telescope
vim.keymap.set('n' , "<leader>fg" , ":Telescope live_grep<CR>" ,{})
vim.keymap.set('n', '<C-p>', ":Telescope find_files<CR>", {})

--window splitting
vim.keymap.set("n" , "<leader>wv" , "<C-w>v" ,{desc="vertical split"})
vim.keymap.set("n" , "<leader>wh" , "<C-w>s" ,{desc="horizontal split"})
vim.keymap.set("n" , "<leader>wx" , ":close<CR>" , {desc="close current"})
vim.keymap.set("n" , "<leader>wi" , ":vertical resize +5<CR>" ,{})
vim.keymap.set("n" , "<leader>wd" , ":vertical resize -5<CR>" ,{})
vim.keymap.set('n', '<C-h>', '<C-w>h', {desc="focus shift to left"})
vim.keymap.set('n', '<C-l>', '<C-w>l',{desc="focus shift to right"})

--delete without copy
vim.keymap.set('v', 'x', '"_x', { noremap = true })
vim.keymap.set('n', 'x', '"_x', { noremap = true })

--lsp
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show diagnostic error msg" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})

--neotree
vim.keymap.set('n', '<leader>no', ':Neotree toggle<CR>', {})

--harpoon in harpoon.lua itself

--cp competitest
vim.keymap.set("n", "<leader>ca", ":CompetiTest add_testcase<CR>", { desc = "Add Testcase" })
vim.keymap.set("n", "<leader>ce", ":CompetiTest edit_testcase<CR>", { desc = "Edit Testcase" })
vim.keymap.set("n", "<leader>cd", ":CompetiTest delete_testcase<CR>", { desc = "Delete Testcase" })
vim.keymap.set("n", "<leader>cr", ":CompetiTest run<CR>", { desc = "Run Testcases" })
vim.keymap.set("n", "<leader>cs", ":CompetiTest show_ui<CR>", { desc = "Show CompetiTest UI" })
vim.keymap.set("n", "<leader>cn", ":CompetiTest run_no_compile<CR>", { desc = "Run Testcases (No Compile)" })
vim.keymap.set("n", "<leader>cc", ":CompetiTest convert<CR>", { desc = "Convert Testcases File" }) -- For single file vs multiple files
vim.keymap.set("n", "<leader>cl", ":%d_|0r ~/Documents/cp/macro.cpp<CR>", {desc= "copy template to current file"})

