-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- General / UI
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.showcmd = true
vim.opt.showmatch = true

-- Tabs & Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 0
vim.opt.autoindent = true
vim.opt.smarttab = true

-- Syntax highlighting is a command, not a standard option
vim.cmd.syntax("enable")

vim.api.nvim_create_user_command('Linuxtabs', function()
    vim.opt.tabstop = 8
    vim.opt.softtabstop = 8
    vim.opt.shiftwidth = 8
    vim.opt.expandtab = false
    print("8-space hard tabs enabled.")
end, { desc = 'Temporarily set 8-space hard tabs' })
