
local set = vim.opt

set.number = true
set.relativenumber = true
set.shiftwidth=4
set.tabstop=4
set.softtabstop = 4
set.expandtab = true
set.cursorline = true


-- set for which_key
vim.o.timeout = true
vim.o.timeoutlen = 300

-- 加载快速配置
require("configs/keymaps")
