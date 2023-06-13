local opt = vim.opt

--行号
opt.relativenumber = true
opt.number = true

--缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--防止包裹
opt.wrap = false

--光标行
opt.cursorline = true

--启用鼠标
opt.mouse:append("a")

--系统剪切板
opt.clipboard:append("unnamedplus")

--默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

--搜索
opt.ignorecase = true
opt.smartcase = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- coc的配置
-- 配置设置有哪些语言的补全
vim.g.coc_global_extensions = {
    'coc-marketplace',
    'coc-tsserver',
    'coc-pyright',
    'coc-lua',
    'coc-json',
    'coc-html-css-support',
    'coc-clangd',
    '@yaegassy/coc-volar',
    'coc-eslint8',
}
-- 一些官方插件的配置（修改）
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 100

