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

-- 注册自动命令
vim.cmd([[
  augroup markdownautocmds
    autocmd!
    autocmd BufWinEnter *.md lua require('config.autocmd').bind_markdown_keys()
  augroup END
]])

local M = {}
M.bind_markdown_keys = bind_markdown_keys
return M
