return {
  {"nvim-treesitter/nvim-treesitter", config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "vim", "bash", "c", "cpp", "javascript", "json", "lua", "python", "html", "css", "go", "php", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    }
  end},
  {"p00f/nvim-ts-rainbow"},
}
