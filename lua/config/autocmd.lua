-- markdonw
local function bind_markdown_keys()
  local buffer = vim.api.nvim_get_current_buf() -- 获取当前buffer
  -- markdonw-preview
  vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>r", ":MarkdownPreview<CR>", { noremap = true, silent = true })
  -- 想通过markdown-toc生成的toc快速跳转
  vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>m", "0%%lv%%hy:let @/ = '#' . ' ' . escape(@+, '/')<CR>/<CR>", { noremap = true, silent = true })
  -- table-mode的开启快捷键
  vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>t", ":TableModeEnable<CR>", { noremap = true, silent = true })
  -- img-paste的粘贴快捷键
  vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>p", ":call mdip#MarkdownClipboardImage()<CR>", { noremap = true, silent = true })
end

-- hex to binary and binary to hex
local function bind_txt_keys()
  vim.keymap.set("n", "<leader>b", ":%!xxd -r<CR>")
  vim.keymap.set("n", "<leader>h", ":%!xxd<CR>")
end

-- 注册自动命令
vim.cmd([[
  augroup markdownautocmds
    autocmd!
    autocmd BufWinEnter *.md lua require('config.autocmd').bind_markdown_keys()
  augroup END
]])

-- hex和binary相互转换
vim.cmd([[
  augroup markdownautocmds
    autocmd!
    autocmd BufWinEnter *.txt lua require('config.autocmd').bind_txt_keys()
  augroup END
]])

-- 保存文件自动格式化(prettier)
vim.cmd([[
augroup prettierautocmds
  autocmd!
  autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.vue :Prettier
augroup END
]])

local M = {}
M.bind_markdown_keys = bind_markdown_keys
M.bind_txt_keys = bind_txt_keys
return M
