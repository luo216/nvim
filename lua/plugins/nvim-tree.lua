return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"}, -- 图标
    config = function()
      require('nvim-tree').setup()
    end,
  -- 其他插件规格
}
