local keymap = vim.keymap

-- 设置leader键
vim.g.mapleader = " "

-- -----------插入模式---------- --
keymap.set("i", "kj", "<ESC>")
-- 设置ctrl+s保存
keymap.set("i", "<C-s>", "<ESC>:w<CR>")

-- -----------视觉模式---------- --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ----------正常模式----------- --
-- Define a Lua function to remove the current buffer and switch to the adjacent buffer
function RemoveCurrentBufferAndSwitch()
    local current_bufnr = vim.fn.bufnr()
    vim.cmd("bd") -- Execute the 'bd' command to delete the buffer

    -- Check if the buffer was successfully deleted
    if vim.fn.bufexists(current_bufnr) == 1 then
        print("Failed to delete buffer.")
        return
    end

    local adjacent_bufnr = vim.fn.bufnr(vim.fn.bufidx('#') - 1)
    if adjacent_bufnr == -1 then
        adjacent_bufnr = vim.fn.bufnr(vim.fn.bufidx('#') + 1) 
    end

    -- Check if the adjacent buffer exists
    if vim.fn.bufexists(adjacent_bufnr) == 1 then
        vim.fn.bufnr(adjacent_bufnr)
    else
        print("No adjacent buffer found.")
    end
end

-- Define a mapping for <leader>w to call the 'RemoveCurrentBufferAndSwitch' function
vim.api.nvim_set_keymap('n', '<leader>w', ':lua RemoveCurrentBufferAndSwitch()<CR>', { noremap = true })

-- 设置shift+l下一个buffer
keymap.set("n", "<S-l>", ":bnext<CR>")
-- 设置shift+h上一个buffer
keymap.set("n", "<S-h>", ":bprevious<CR>")

-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

-- 设置ctrl+s保存
keymap.set("n", "<C-s>", ":w<CR>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- FZF
keymap.set("n", "<leader>f", ":FZF<CR>")

-- ---------- 插件 ----------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- coc 的快捷键

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use `[g` and `]g` to navigate diagnostics 上/下一个报错
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
