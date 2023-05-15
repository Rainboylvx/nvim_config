# nvim_config

这里是我的nvim的配置文件，同时我也记录下一步一步的配置neovim的过程.

我使用的环境

- archLinux
- nvim >= 0.8

Table of Contents
=================

* [nvim_config](#nvim_config)
   * [1.准备](#1准备)
      * [1.1 在archlinux系统下安装相关的软件](#11-在archlinux系统下安装相关的软件)
   * [2. 安装 lazy.nvim](#2-安装-lazynvim)
   * [使用的插件](#使用的插件)
      * [nvim-treesitter](#nvim-treesitter)
      * [<a href="https://github.com/nvim-tree/nvim-tree.lua">nvim-tree</a>](#nvim-tree)
      * [nvim dap](#nvim-dap)
      * [which key](#which-key)

## 1.准备


因为nvim使用了lua的作为配置语言，所以我们需要掌握一下前置的lua相关知识，你可以通过下面的方式来学习

- [nvim lua guide](https://github.com/nanotee/nvim-lua-guide)
- Neovim documentation, see `:help lua-guide warning`

### 1.1 在archlinux系统下安装相关的软件

```sh
sudo pacman -S neovim gcc xsel gdb make cmake lua git
sudo pacman -S python nodejs
sudo pacman -S python-neovim yarn
sudo pacman -S ttf-firacode-nerd
```

此时就可以使用neovim了，终端输入`nvim`

因为国内的访问github的速度不好，所以通过下面的命令来加速github

```sh
git config --global url."https://ghproxy.net/https://github".insteadOf "https://github"
```

在`~/.config/nvim`下的目录

```
.
├── init.lua
└── lua
    ├── configs
    │   ├── init.lua
    │   └── keymaps.lua
    └── plugins
        ├── init.lua
        └── lazy.lua
```

## 2. 安装 lazy.nvim 

nvim需要安装大量的插件，那就需要一个管理其它插件的插件。这里我选择[lazy.nvim](https://github.com/folke/lazy.nvim)


根据`lazy.nvim`的文档

1. 下载`lazy.nvim`
```sh
git clone  --filter=blob:none\
    https://github.com/folke/lazy.nvim.git\
    --branch=stable \
    ~/.local/share/nvim/lazy/lazy.nvim
```

需要在`~/.config/nvim/init.lua`文件添加内容：

```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("plugins") -- 加载插件的配置
require("configs") -- 加载自己的配置
```


在`plugins/lazy.lua`文件添加内容为：

```lua
-- Example using a list of specs with the default options

require("lazy").setup({
  "ellisonleao/gruvbox.nvim"
})
```

在`plugins/init.lua`文件添加内容为：

```lua
require("plugins/lazy")
```

在`configs/init.lua`文件添加内容为：

```lua
-- 设置颜色方案
vim.o.backgroud = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth=4
vim.opt.tabstop=4

-- 加载快速配置
require("configs/keymaps")
```


这样我们就可以配置一个最简单的nvim，它使用`gruvbox`作为主题 

## 使用的插件

### nvim-treesitter

`nvim-treesitter`提供了一种简单的方式来使用`tree-sitter`

使用方式:TODO

### [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

> A file explorer tree for neovim written in lua
> 一个文件浏览插件

配置

```lua
```

### nvim dap

dap = Debug Adapter Protocol,`nvim-dap` is a Debug Adapter Protocol client implementation for [Neovim](https://neovim.io/).
`nvim-dap` allow us to launch an application to debug;

它由下面这些插件组成

- [mfussenegger/nvim-dap: Debug Adapter Protocol client implementation for Neovim](https://github.com/mfussenegger/nvim-dap)
- [rcarriga/nvim-dap-ui: A UI for nvim-dap](https://github.com/rcarriga/nvim-dap-ui)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)


配置文件在`lua/plugins/nvim_dap.lua`

faq

如何自动停止在main函数
如何自动编译文件，自动lunach文件，自行停止在main，
自动读取in文件

### which key

我们使用[which-key.nvim](https://github.com/folke/which-key.nvim)作为nvim快速键的管理工具


创建`plugins/which_key.lua`里添加

在`configs/init.lua`添加

```
vim.o.timeout = true
vim.o.timeoutlen = 300
```

`which_key`可以下面的方式的触发，也可以通过`leader`进行触发

```
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
```


