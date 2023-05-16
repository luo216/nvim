return {
  {
  "morhetz/gruvbox", -- 主题
  config = function ()
    vim.cmd[[colorscheme gruvbox]]
  end
  },
  "folke/tokyonight.nvim", -- 主题
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"}, -- 图标
    config = function()
      require('lualine').setup({
        options = {
          theme = 'gruvbox'
        },
      })
    end,
  },
  -- 其他插件规格
}
