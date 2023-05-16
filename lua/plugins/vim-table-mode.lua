return {
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    config = function()
      vim.g.table_mode_corner_corner = "|"
      vim.g.table_mode_corner_vertical = "|"
      vim.g.table_mode_vertical_corner = "|"
      vim.g.table_mode_enable_mappings = 0
    end,
  },
}
