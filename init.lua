local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- require("plugins") -- 加载插件的配置

-- Example using a list of specs with the default options

require("lazy").setup({
    { 
        "ellisonleao/gruvbox.nvim" ,
        config = function()
            -- 设置颜色方案
            vim.o.backgroud = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end
    },

    {
        "folke/which-key.nvim",
        config = function() 
            require("plugins/which_key")
        end,
    },

    {
        "mfussenegger/nvim-dap",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()

            require("plugins/nvim_dap")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() 
            require("plugins/nvim-tree")
        end,
    },


    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function() 
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true
            vim.keymap.set('n','<F2>',':NvimTreeToggle<cr>')
            require("plugins.nvim-tree")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup{}
        end,
    },

    { 
        "hrsh7th/nvim-cmp", 
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "uga-rosa/cmp-dictionary",
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim"
        },
        config = function() 
            require("plugins/cmp")
        end,
    },

    {
        "/neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").pyright.setup{}
            require("lspconfig").clangd.setup{}
        end,
    }
})

require("configs") -- 加载自己的配置

