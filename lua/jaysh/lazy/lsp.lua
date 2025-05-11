return {
    "neovim/nvim-lspconfig",
	dependencies = {
        { "mason-org/mason.nvim", version = "^1.*"},
        { "mason-org/mason-lspconfig.nvim", version = "^1.*"},
        { "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
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
            -- Mason configs go in here.
		})
        require("mason-lspconfig").setup({
            -- mason-lspconfig configs go in here.
            ensure_installed = {
                "lua_ls",
                "harper_ls",
            },
            handlers = {
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup{}
                end,
            }
        })
        -- language-specific configs go in here
        -- require("nvim-lspconfig").lua_ls.setup({})
        -- require("nvim-lspconfig").harper_ls.setup({})
	end
}
