-- Example using a list of specs with the default options

require("lazy").setup({
	{ "ellisonleao/gruvbox.nvim" },

	{"folke/which-key.nvim"},

    {"mfussenegger/nvim-dap"},
    {"rcarriga/nvim-dap-ui"},

    {
        "nvim-treesitter/nvim-treesitter",
         build = ":TSUpdate",
    },

    {"theHamsta/nvim-dap-virtual-text"},

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
        end,
    },

    { 
        "hrsh7th/nvim-cmp", 
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "uga-rosa/cmp-dictionary",
        }
    },
})
