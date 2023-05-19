local wk = require("which-key")
wk.register({ f = { name = "file", -- optional group name n = { "New File" }, -- just a label. don't create any mapping e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })



wk.register({
    ['e'] = {'<cmd>NvimTreeToggle<cr>','Explorer'},
    ['q'] = {'<cmd>qall<cr>','quit nvim'}
}, { prefix = "<leader>" })

-- translator
wk.register({
    t = {
        name="translator",
        w = {"<cmd>TranslateW<cr>","TranslateW"}
    }
},{prefix = "<leader>"})

-- nvim dap 
wk.register({
    d = {
        name = 'Debug',
        R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", 'Run to Cursor' },
        E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", 'Evaluate Input' },
        X = { "<cmd>lua require'dap'.terminate()<cr>", 'Terminate' },
        -- C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
        T = { "<cmd>lua require'dapui'.toggle('sidebar')<cr>", 'Toggle Sidebar' },
        -- p = { "<cmd>lua require'dap'.pause()<cr>", 'Pause' },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Toggle Repl' },
        q = { "<cmd>lua require'dap'.close()<cr>", 'Quit' },

        -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        -- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        -- d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        -- e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
        -- g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        -- h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
        -- S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
        -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        -- t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        -- u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    }
},{prefix ="<leader>"})
