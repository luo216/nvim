return {
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
    build = "cd app && yarn install",
    -- 设置preveiew浏览器
    config = function()
      vim.g.mkdp_browser = "chromium"
    end,
	},
}
