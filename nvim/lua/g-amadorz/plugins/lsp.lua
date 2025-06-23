return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "saghen/blink.nvim",
                "folke/lazydev.nvim",
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("blink.cmp").setup({
                completion = {
                    menu = {
                        draw = {
                            -- We don't need label_description now because label and label_description are already
                            -- combined together in label by colorful-menu.nvim.
                            columns = { { "kind_icon" }, { "label", gap = 1 } },
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                    },
                },
            })
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup { capabilities = capabilities }
            lspconfig.clangd.setup { capabilities = capabilities }
            lspconfig.gopls.setup { capabilties = capabilities }
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
            })
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if not client then return end
                    -- Auto-format ("lint") on save.
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if not client:supports_method('textDocument/willSaveWaitUntil')
                        and client:supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
