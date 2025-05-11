return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
        "mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			},
            -- Mason Configs go in here.
		})
        require("mason-lspconfig").setup({
            -- Mason-LSPConfig configs go in here.
        }),
	end
}
