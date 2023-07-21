-- -----------正常模式---------- --

-- -----------插入模式---------- --
vim.keymap.set("i", "kj", "<ESC>")

-- -----------视觉模式---------- --
-- 单行或多行移动
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
