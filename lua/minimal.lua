local ns = vim.api.nvim_create_namespace("myplugin")
local id = vim.api.nvim_buf_set_extmark(0, ns, 0, 0, {virt_text = {{"1"}}})
vim.api.nvim_buf_set_extmark(0, ns, 0, 0, {id = id, virt_text = {{"1"}, {" 2"}}})
