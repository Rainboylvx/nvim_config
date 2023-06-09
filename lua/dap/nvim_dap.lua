-- 设置 自动读取 in 文件
-- 设置 手动设置 in 文件的名字
local dap = require('dap')

require("dap.lang.cpp")


-- keymaps

-- compile
-- start debug
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
-- step over
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
-- step into
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
-- step out
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
-- toggle breakpoint
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- set breakpoint
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
