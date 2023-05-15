local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })



wk.register({
    ['e'] = {'<cmd>NvimTreeToggle<cr>','Explorer'},
    ['q'] = {'<cmd>qall<cr>','quit nvim'}
}, { prefix = "<leader>" })
