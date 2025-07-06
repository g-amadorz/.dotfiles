return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"saghen/blink.nvim",
				"folke/lazydev.nvim",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"xzbdmw/colorful-menu.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"gopls",
					"rust_analyzer",
					"jdtls",
				},
			})
		end,
	},
}
