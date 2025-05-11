return {
	-- Optional, if you want icons for renamed files
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	-- Rabbit
	{
		"voxelprismatic/rabbit.nvim",

		-- Important! The master branch is the previous version
		branch = "rewrite",

		-- Important! Rabbit should launch on startup to track buffers properly
		lazy = false,

		---@type Rabbit.Config
		opts = {},
		config = true,
	}
}
